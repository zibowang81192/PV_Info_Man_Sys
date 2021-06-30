/*
Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/6/29
  Time: 11:03
* 使用RSA算法对管理员登录密码进行加密
*
* */
package com.wzb.pvms.util;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.security.*;
import java.util.Base64;

public class RsaUtils {

    /**
     * 算法名称
     */
    private static final String ALGORITHM_RSA = "RSA";

    /**
     * 签名算法
     */
    public static final String SIGNATURE_ALGORITHM = "SHA512withRSA";

    /**
     * 生成密钥对
     *
     * @param keySize 密钥长度
     * @return 密钥对
     */
    public static KeyPair keyPair(int keySize) throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(ALGORITHM_RSA);
        keyPairGenerator.initialize(keySize);
        return keyPairGenerator.generateKeyPair();
    }

    /**
     * RSA 私钥加密
     *
     * @param privateKey 私钥
     * @param content    待加密内容
     * @return 加密后密文字节数组
     */
    public static byte[] encryptByPrivateKey(PrivateKey privateKey, byte[] content) {
        try {
            Cipher cipher = Cipher.getInstance(ALGORITHM_RSA);
            cipher.init(Cipher.ENCRYPT_MODE, privateKey);
            return cipher.doFinal(content);
        } catch (NoSuchAlgorithmException e) {
            throw new UnsupportedOperationException("No Such Algorithm");
        } catch (NoSuchPaddingException e) {
            throw new UnsupportedOperationException("No Such Padding");
        } catch (InvalidKeyException e) {
            throw new UnsupportedOperationException("Invalid Key");
        } catch (BadPaddingException e) {
            throw new UnsupportedOperationException("Bad Padding");
        } catch (IllegalBlockSizeException e) {
            throw new UnsupportedOperationException("Illegal Block Size");
        }
    }

    /**
     * RSA 公钥加密
     *
     * @param publicKey 公钥
     * @param content   待加密内容
     * @return 加密后密文字节数组
     */
    public static byte[] encryptByPublicKey(PublicKey publicKey, byte[] content) {
        try {
            Cipher cipher = Cipher.getInstance(ALGORITHM_RSA);
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            return cipher.doFinal(content);
        } catch (NoSuchAlgorithmException e) {
            throw new UnsupportedOperationException("No Such Algorithm");
        } catch (NoSuchPaddingException e) {
            throw new UnsupportedOperationException("No Such Padding");
        } catch (InvalidKeyException e) {
            throw new UnsupportedOperationException("Invalid Key");
        } catch (BadPaddingException e) {
            throw new UnsupportedOperationException("Bad Padding");
        } catch (IllegalBlockSizeException e) {
            throw new UnsupportedOperationException("Illegal Block Size");
        }
    }

    /**
     * RSA 私钥解密
     *
     * @param privateKey 私钥
     * @param content    密文
     * @return 解密后原文字节数组
     */
    public static byte[] decryptByPrivateKey(PrivateKey privateKey, byte[] content) {
        try {
            Cipher cipher = Cipher.getInstance(ALGORITHM_RSA);
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            return cipher.doFinal(content);
        } catch (NoSuchAlgorithmException e) {
            throw new UnsupportedOperationException("No Such Algorithm");
        } catch (NoSuchPaddingException e) {
            throw new UnsupportedOperationException("No Such Padding");
        } catch (InvalidKeyException e) {
            throw new UnsupportedOperationException("Invalid Key");
        } catch (BadPaddingException e) {
            throw new UnsupportedOperationException("Bad Padding");
        } catch (IllegalBlockSizeException e) {
            throw new UnsupportedOperationException("Illegal Block Size");
        }
    }

    /**
     * RSA 公钥解密
     *
     * @param publicKey 公钥
     * @param content   密文
     * @return 解密后原文字节数组
     */
    public static byte[] decryptByPublicKey(PublicKey publicKey, byte[] content) {
        try {
            Cipher cipher = Cipher.getInstance(ALGORITHM_RSA);
            cipher.init(Cipher.DECRYPT_MODE, publicKey);
            return cipher.doFinal(content);
        } catch (NoSuchAlgorithmException e) {
            throw new UnsupportedOperationException("No Such Algorithm");
        } catch (NoSuchPaddingException e) {
            throw new UnsupportedOperationException("No Such Padding");
        } catch (InvalidKeyException e) {
            throw new UnsupportedOperationException("Invalid Key");
        } catch (BadPaddingException e) {
            throw new UnsupportedOperationException("Bad Padding");
        } catch (IllegalBlockSizeException e) {
            throw new UnsupportedOperationException("Illegal Block Size");
        }
    }

    /**
     * 用私钥生成数字签名
     *
     * @param content    签名内容
     * @param privateKey 私钥
     * @return 数字签名
     */
    public static String sign(byte[] content, PrivateKey privateKey) {
        try {
            Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
            signature.initSign(privateKey);
            signature.update(content);
            return Base64.getEncoder().encodeToString(signature.sign());
        } catch (NoSuchAlgorithmException e) {
            throw new UnsupportedOperationException("No Such Algorithm");
        } catch (SignatureException e) {
            throw new UnsupportedOperationException("Signature Exception");
        } catch (InvalidKeyException e) {
            throw new UnsupportedOperationException("Invalid Key");
        }
    }

    /**
     * 用公钥验证数字签名
     *
     * @param content   签名内容
     * @param publicKey 公钥
     * @param sign      签名
     * @return 验证结果
     */
    public static boolean verify(byte[] content, PublicKey publicKey, String sign) {
        try {
            Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
            signature.initVerify(publicKey);
            signature.update(content);
            return signature.verify(Base64.getDecoder().decode(sign));
        } catch (NoSuchAlgorithmException e) {
            throw new UnsupportedOperationException("No Such Algorithm");
        } catch (SignatureException e) {
            throw new UnsupportedOperationException("Signature Exception");
        } catch (InvalidKeyException e) {
            throw new UnsupportedOperationException("Invalid Key");
        }
    }
}