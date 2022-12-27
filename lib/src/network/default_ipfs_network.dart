import 'dart:convert';
import 'dart:io';

import 'package:chain_wallet/chain_wallet.dart';
import 'package:cryptography/cryptography.dart';
import 'package:path_provider/path_provider.dart';

/// {@template client_config}
/// Default Ipfs network configuration
/// {@endtemplate}
class DefaultIpfsNetworkConfig {
  /// {@macro client_config}
  DefaultIpfsNetworkConfig ({
    required this.nftStorageApiKey,
  });

  /// IPFS Api key
  final String nftStorageApiKey;
}

/// {@template default_network}
/// A very simple implementation of a network based on IPFS that stores
/// transaction data publicly on the IPFS network. Actual transaction data
/// is encrypted on the network, but key information is stored in a manner
/// that can be deterministically located by proxies.
/// {@endtemplate}
class DefaultIpfsNetwork implements NetworkClientService {
  /// {@macro default_network}
  DefaultIpfsNetwork(DefaultIpfsNetworkConfig config) {
   client = NFTStorageClient(nftStorageApiKey: config.nftStorageApiKey);
  }
  /// NFTStorage client
  late NFTStorageClient client;

  @override
  Future<String> sendTransaction(Transaction tx, TransactionType txType) async {
    final keyAndIV = randomBytes(48);
    final key = keyAndIV.sublist(0, 32);
    final iv = keyAndIV.sublist(32);

    final algorithm = AesGcm.with256bits();
    final secretKey = SecretKey(key);

    final txStr = jsonEncode(tx.toJson());

    final secretBox = await algorithm.encrypt(
      utf8.encode(txStr),
      secretKey: secretKey,
      nonce: iv,
    );

    final tempDir = await getTemporaryDirectory();
    final tempPath1 = '${tempDir.path}/temp_01.tmp';

    final txTypeBuf = toHexBuffer(transactionTypes[txType]!);

    final txFile = await File(tempPath1).writeAsBytes(txTypeBuf);
    await txFile.writeAsBytes(secretBox.mac.bytes, mode: FileMode.append);
    await txFile.writeAsBytes(secretBox.cipherText, mode: FileMode.append);

    final txHashRes = await client.write(data: await txFile.readAsBytes());

    await txFile.delete();

    final tempPath2 = '${tempDir.path}/temp_02.tmp';

    final hashBuf = utf8.encode(txHashRes.cid);

    final hashFile = await File(tempPath2).writeAsBytes(keyAndIV);
    await hashFile.writeAsBytes(hashBuf, mode: FileMode.append);

    final hashRes = await client.write(data: await hashFile.readAsBytes());

    await hashFile.delete();

    return hashRes.cid;
  }

  @override
  String toHex() => '';
}
