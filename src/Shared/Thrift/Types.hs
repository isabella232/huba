{-# LANGUAGE TemplateHaskell #-}

module Shared.Thrift.Types where

import qualified Huba_Types as T

import Data.Int(Int64(), Int32())
import Data.Vector (Vector())
import Data.Text.Lazy (Text())
import qualified Data.HashSet as Set
import qualified Data.HashMap.Lazy as Map

import Data.Ord (comparing)

import Lens.Family2.TH

type ColumnName = T.ColumnName

data ColumnValue = StringValue Text
                 | IntValue Int64
                 | StringSet (Set.HashSet Text)
                 | StringVector (Vector Text)
  deriving (Show, Eq)

data LogMessage = LogMessage { _lmTimestamp :: Int64
                             , _lmTable :: Text
                             , _lmColumns :: Map.HashMap Text ColumnValue
                             } deriving (Show, Eq)

instance Ord LogMessage where
    compare = comparing _lmTimestamp `orComparing` _lmTable
        where orComparing comp f x x' = case comp x x' of
                                              EQ -> comparing f x x'
                                              o -> o

type LogBatch = Vector LogMessage

data LogResponse = LogResponse { _lrCode :: Int32
                               , _lrMessage :: Text
                               } deriving Show

type AggregationFunction = T.AggregationFunction

data ColumnExpression = ColumnExpression { _ceColumn :: ColumnName
                                         , _ceAggregationFunction :: AggregationFunction
                                         } deriving (Show, Eq)

type ComparisonFunction = T.ComparisonFunction

data Condition = Condition { _cColumn :: ColumnName
                           , _cComparisonFunction :: ComparisonFunction
                           , _cValue :: ColumnValue
                           }
  deriving (Show, Eq)

data Query = Query { _qColumnExpressions :: Vector ColumnExpression
                   , _qTable :: Text
                   , _qTimeStart :: Int64
                   , _qTimeEnd :: Int64
                   , _qConditions :: Maybe (Vector Condition)
                   , _qGroupBy :: Maybe (Vector ColumnName)
                   , _qOrderBy :: Maybe Int32
                   , _qLimit :: Maybe Int32
                   }
  deriving (Show,Eq)

data ResponseValue = RStringValue Text
                   | RIntValue Int64
                   | RStringSet (Set.HashSet Text)
                   | RStringVector (Vector Text)
                   | RDoubleValue Double
                   | RNull
  deriving (Show, Eq)

data Row = Row { rValues :: Vector ResponseValue }
  deriving (Show, Eq)

data QueryResponse = QueryResponse { _qrCode :: Int32
                                   , _qrMessage :: Maybe Text
                                   , _qrRows :: Maybe (Vector Row)
                                   }
  deriving (Show, Eq)



makeLenses ''LogMessage
makeLenses ''LogResponse
makeLenses ''ColumnExpression
makeLenses ''Condition
makeLenses ''Query
makeLenses ''Row
makeLenses ''QueryResponse
