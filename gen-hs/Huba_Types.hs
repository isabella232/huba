{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift Compiler (0.9.1)                      --
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING --
-----------------------------------------------------------------

module Huba_Types where
import Prelude ( Bool(..), Enum, Double, String, Maybe(..),
                 Eq, Show, Ord,
                 return, length, IO, fromIntegral, fromEnum, toEnum,
                 (.), (&&), (||), (==), (++), ($), (-) )

import Control.Exception
import Data.ByteString.Lazy
import Data.Hashable
import Data.Int
import Data.Text.Lazy ( Text )
import qualified Data.Text.Lazy as TL
import Data.Typeable ( Typeable )
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet as Set
import qualified Data.Vector as Vector

import Thrift
import Thrift.Types ()


type ColumnName = Text

data ColumnValue = ColumnValue{f_ColumnValue_stringValue :: Maybe Text,f_ColumnValue_intValue :: Maybe Int64,f_ColumnValue_stringSet :: Maybe (Set.HashSet Text),f_ColumnValue_stringVector :: Maybe (Vector.Vector Text)} deriving (Show,Eq,Typeable)
instance Hashable ColumnValue where
  hashWithSalt salt record = salt   `hashWithSalt` f_ColumnValue_stringValue record   `hashWithSalt` f_ColumnValue_intValue record   `hashWithSalt` f_ColumnValue_stringSet record   `hashWithSalt` f_ColumnValue_stringVector record  
write_ColumnValue oprot record = do
  writeStructBegin oprot "ColumnValue"
  case f_ColumnValue_stringValue record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("stringValue",T_STRING,1)
    writeString oprot _v
    writeFieldEnd oprot}
  case f_ColumnValue_intValue record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("intValue",T_I64,2)
    writeI64 oprot _v
    writeFieldEnd oprot}
  case f_ColumnValue_stringSet record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("stringSet",T_SET,3)
    (let {f [] = return (); f (_viter2:t) = do {writeString oprot _viter2;f t}} in do {writeSetBegin oprot (T_STRING,fromIntegral $ Set.size _v); f (Set.toList _v);writeSetEnd oprot})
    writeFieldEnd oprot}
  case f_ColumnValue_stringVector record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("stringVector",T_LIST,4)
    (let f = Vector.mapM_ (\_viter3 -> writeString oprot _viter3) in do {writeListBegin oprot (T_STRING,fromIntegral $ Vector.length _v); f _v;writeListEnd oprot})
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_ColumnValue_fields iprot record = do
  (_,_t5,_id6) <- readFieldBegin iprot
  if _t5 == T_STOP then return record else
    case _id6 of 
      1 -> if _t5 == T_STRING then do
        s <- readString iprot
        read_ColumnValue_fields iprot record{f_ColumnValue_stringValue=Just s}
        else do
          skip iprot _t5
          read_ColumnValue_fields iprot record
      2 -> if _t5 == T_I64 then do
        s <- readI64 iprot
        read_ColumnValue_fields iprot record{f_ColumnValue_intValue=Just s}
        else do
          skip iprot _t5
          read_ColumnValue_fields iprot record
      3 -> if _t5 == T_SET then do
        s <- (let {f 0 = return []; f n = do {v <- readString iprot;r <- f (n-1); return $ v:r}} in do {(_etype10,_size7) <- readSetBegin iprot; l <- f _size7; return $ Set.fromList l})
        read_ColumnValue_fields iprot record{f_ColumnValue_stringSet=Just s}
        else do
          skip iprot _t5
          read_ColumnValue_fields iprot record
      4 -> if _t5 == T_LIST then do
        s <- (let f n = Vector.replicateM (fromIntegral n) (readString iprot) in do {(_etype15,_size12) <- readListBegin iprot; f _size12})
        read_ColumnValue_fields iprot record{f_ColumnValue_stringVector=Just s}
        else do
          skip iprot _t5
          read_ColumnValue_fields iprot record
      _ -> do
        skip iprot _t5
        readFieldEnd iprot
        read_ColumnValue_fields iprot record
read_ColumnValue iprot = do
  _ <- readStructBegin iprot
  record <- read_ColumnValue_fields iprot (ColumnValue{f_ColumnValue_stringValue=Nothing,f_ColumnValue_intValue=Nothing,f_ColumnValue_stringSet=Nothing,f_ColumnValue_stringVector=Nothing})
  readStructEnd iprot
  return record
data LogMessage = LogMessage{f_LogMessage_timestamp :: Maybe Int64,f_LogMessage_table :: Maybe Text,f_LogMessage_columns :: Maybe (Map.HashMap Text ColumnValue)} deriving (Show,Eq,Typeable)
instance Hashable LogMessage where
  hashWithSalt salt record = salt   `hashWithSalt` f_LogMessage_timestamp record   `hashWithSalt` f_LogMessage_table record   `hashWithSalt` f_LogMessage_columns record  
write_LogMessage oprot record = do
  writeStructBegin oprot "LogMessage"
  case f_LogMessage_timestamp record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("timestamp",T_I64,1)
    writeI64 oprot _v
    writeFieldEnd oprot}
  case f_LogMessage_table record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("table",T_STRING,2)
    writeString oprot _v
    writeFieldEnd oprot}
  case f_LogMessage_columns record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("columns",T_MAP,3)
    (let {f [] = return (); f ((_kiter19,_viter20):t) = do {do {writeString oprot _kiter19;write_ColumnValue oprot _viter20};f t}} in do {writeMapBegin oprot (T_STRING,T_STRUCT,fromIntegral $ Map.size _v); f (Map.toList _v);writeMapEnd oprot})
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_LogMessage_fields iprot record = do
  (_,_t22,_id23) <- readFieldBegin iprot
  if _t22 == T_STOP then return record else
    case _id23 of 
      1 -> if _t22 == T_I64 then do
        s <- readI64 iprot
        read_LogMessage_fields iprot record{f_LogMessage_timestamp=Just s}
        else do
          skip iprot _t22
          read_LogMessage_fields iprot record
      2 -> if _t22 == T_STRING then do
        s <- readString iprot
        read_LogMessage_fields iprot record{f_LogMessage_table=Just s}
        else do
          skip iprot _t22
          read_LogMessage_fields iprot record
      3 -> if _t22 == T_MAP then do
        s <- (let {f 0 = return []; f n = do {k <- readString iprot; v <- (read_ColumnValue iprot);r <- f (n-1); return $ (k,v):r}} in do {(_ktype25,_vtype26,_size24) <- readMapBegin iprot; l <- f _size24; return $ Map.fromList l})
        read_LogMessage_fields iprot record{f_LogMessage_columns=Just s}
        else do
          skip iprot _t22
          read_LogMessage_fields iprot record
      _ -> do
        skip iprot _t22
        readFieldEnd iprot
        read_LogMessage_fields iprot record
read_LogMessage iprot = do
  _ <- readStructBegin iprot
  record <- read_LogMessage_fields iprot (LogMessage{f_LogMessage_timestamp=Nothing,f_LogMessage_table=Nothing,f_LogMessage_columns=Nothing})
  readStructEnd iprot
  return record
data LogResponse = LogResponse{f_LogResponse_code :: Maybe Int32,f_LogResponse_message :: Maybe Text} deriving (Show,Eq,Typeable)
instance Hashable LogResponse where
  hashWithSalt salt record = salt   `hashWithSalt` f_LogResponse_code record   `hashWithSalt` f_LogResponse_message record  
write_LogResponse oprot record = do
  writeStructBegin oprot "LogResponse"
  case f_LogResponse_code record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("code",T_I32,1)
    writeI32 oprot _v
    writeFieldEnd oprot}
  case f_LogResponse_message record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("message",T_STRING,2)
    writeString oprot _v
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_LogResponse_fields iprot record = do
  (_,_t32,_id33) <- readFieldBegin iprot
  if _t32 == T_STOP then return record else
    case _id33 of 
      1 -> if _t32 == T_I32 then do
        s <- readI32 iprot
        read_LogResponse_fields iprot record{f_LogResponse_code=Just s}
        else do
          skip iprot _t32
          read_LogResponse_fields iprot record
      2 -> if _t32 == T_STRING then do
        s <- readString iprot
        read_LogResponse_fields iprot record{f_LogResponse_message=Just s}
        else do
          skip iprot _t32
          read_LogResponse_fields iprot record
      _ -> do
        skip iprot _t32
        readFieldEnd iprot
        read_LogResponse_fields iprot record
read_LogResponse iprot = do
  _ <- readStructBegin iprot
  record <- read_LogResponse_fields iprot (LogResponse{f_LogResponse_code=Nothing,f_LogResponse_message=Nothing})
  readStructEnd iprot
  return record
data InvalidLogMessageException = InvalidLogMessageException{f_InvalidLogMessageException_code :: Maybe Int32,f_InvalidLogMessageException_message :: Maybe Text} deriving (Show,Eq,Typeable)
instance Exception InvalidLogMessageException
instance Hashable InvalidLogMessageException where
  hashWithSalt salt record = salt   `hashWithSalt` f_InvalidLogMessageException_code record   `hashWithSalt` f_InvalidLogMessageException_message record  
write_InvalidLogMessageException oprot record = do
  writeStructBegin oprot "InvalidLogMessageException"
  case f_InvalidLogMessageException_code record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("code",T_I32,1)
    writeI32 oprot _v
    writeFieldEnd oprot}
  case f_InvalidLogMessageException_message record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("message",T_STRING,2)
    writeString oprot _v
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_InvalidLogMessageException_fields iprot record = do
  (_,_t37,_id38) <- readFieldBegin iprot
  if _t37 == T_STOP then return record else
    case _id38 of 
      1 -> if _t37 == T_I32 then do
        s <- readI32 iprot
        read_InvalidLogMessageException_fields iprot record{f_InvalidLogMessageException_code=Just s}
        else do
          skip iprot _t37
          read_InvalidLogMessageException_fields iprot record
      2 -> if _t37 == T_STRING then do
        s <- readString iprot
        read_InvalidLogMessageException_fields iprot record{f_InvalidLogMessageException_message=Just s}
        else do
          skip iprot _t37
          read_InvalidLogMessageException_fields iprot record
      _ -> do
        skip iprot _t37
        readFieldEnd iprot
        read_InvalidLogMessageException_fields iprot record
read_InvalidLogMessageException iprot = do
  _ <- readStructBegin iprot
  record <- read_InvalidLogMessageException_fields iprot (InvalidLogMessageException{f_InvalidLogMessageException_code=Nothing,f_InvalidLogMessageException_message=Nothing})
  readStructEnd iprot
  return record
