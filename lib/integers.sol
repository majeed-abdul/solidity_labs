// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract IntegerVariations {
    int8 public int8Var;
    int16 public int16Var;
    int32 public int32Var;
    int64 public int64Var;
    int128 public int128Var;
    int256 public int256Var;
    uint8 public uint8Var;
    uint16 public uint16Var;
    uint32 public uint32Var;
    uint64 public uint64Var;
    uint128 public uint128Var;
    uint256 public uint256Var;
    // minimum and maximum of int
    uint public maxUint = type(uint).max;
    int public minInt8 = type(int8).min;
    int public maxInt8 = type(int8).max;
    int public minInt16 = type(int16).min;
    int public maxInt16 = type(int16).max;
    int public minInt32 = type(int32).min;
    int public maxInt32 = type(int32).max;
    int public minInt64 = type(int64).min;
    int public maxInt64 = type(int64).max;
    int public minInt128 = type(int128).min;
    int public maxInt128 = type(int128).max;
    int public minInt256 = type(int256).min;
    int public maxInt256 = type(int256).max;
    // minimum and maximum of Uint
    uint public minUint8 = type(uint8).min;
    uint public maxUint8 = type(uint8).max;
    uint public minUint16 = type(uint16).min;
    uint public maxUint16 = type(uint16).max;
    uint public minUint32 = type(uint32).min;
    uint public maxUint32 = type(uint32).max;
    uint public minUint64 = type(uint64).min;
    uint public maxUint64 = type(uint64).max;
    uint public minUint128 = type(uint128).min;
    uint public maxUint128 = type(uint128).max;
    uint public minUint256 = type(uint256).min;
    uint public maxUint256 = type(uint256).max;
}