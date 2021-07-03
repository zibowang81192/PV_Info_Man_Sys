package com.wzb.pvms.test;

import com.wzb.pvms.util.RsaUtils;
import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;

public class RsaUtilsTest {

    @Test
    public void test() throws NoSuchAlgorithmException {
        String content = "RSA encrypt/decrypt demo";
        KeyPair keyPair = RsaUtils.keyPair(2048);
        // 测试私钥加密公钥解密
        byte[] encryptByPrivateKeyResult = RsaUtils.encryptByPrivateKey(keyPair.getPrivate(),
                content.getBytes(StandardCharsets.UTF_8));
        byte[] decryptByPublicKeyResult = RsaUtils.decryptByPublicKey(keyPair.getPublic(),
                encryptByPrivateKeyResult);
        Assert.assertEquals(content, new String(decryptByPublicKeyResult, StandardCharsets.UTF_8));
        // 测试公钥加密私钥解密
        byte[] encryptByPublicKeyResult = RsaUtils.encryptByPublicKey(keyPair.getPublic(),
                content.getBytes(StandardCharsets.UTF_8));
        byte[] decryptByPrivateKeyResult = RsaUtils.decryptByPrivateKey(keyPair.getPrivate(),
                encryptByPublicKeyResult);
        Assert.assertEquals(content, new String(decryptByPrivateKeyResult, StandardCharsets.UTF_8));
        // 测试签名
        String sign = RsaUtils.sign(content.getBytes(StandardCharsets.UTF_8), keyPair.getPrivate());
        Assert.assertTrue(RsaUtils.verify(content.getBytes(StandardCharsets.UTF_8), keyPair.getPublic(), sign));
    }
}