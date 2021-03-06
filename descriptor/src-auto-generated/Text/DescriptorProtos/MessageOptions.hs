{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Text.DescriptorProtos.MessageOptions (MessageOptions(..)) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Text.DescriptorProtos.UninterpretedOption as DescriptorProtos (UninterpretedOption)
 
data MessageOptions = MessageOptions{message_set_wire_format :: !(P'.Maybe P'.Bool),
                                     no_standard_descriptor_accessor :: !(P'.Maybe P'.Bool), deprecated :: !(P'.Maybe P'.Bool),
                                     map_entry :: !(P'.Maybe P'.Bool),
                                     uninterpreted_option :: !(P'.Seq DescriptorProtos.UninterpretedOption),
                                     ext'field :: !(P'.ExtField), unknown'field :: !(P'.UnknownField)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.ExtendMessage MessageOptions where
  getExtField = ext'field
  putExtField e'f msg = msg{ext'field = e'f}
  validExtRanges msg = P'.extRanges (P'.reflectDescriptorInfo msg)
 
instance P'.UnknownMessage MessageOptions where
  getUnknownField = unknown'field
  putUnknownField u'f msg = msg{unknown'field = u'f}
 
instance P'.Mergeable MessageOptions where
  mergeAppend (MessageOptions x'1 x'2 x'3 x'4 x'5 x'6 x'7) (MessageOptions y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = MessageOptions (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
 
instance P'.Default MessageOptions where
  defaultValue
   = MessageOptions (Prelude'.Just Prelude'.False) (Prelude'.Just Prelude'.False) (Prelude'.Just Prelude'.False) P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
 
instance P'.Wire MessageOptions where
  wireSize ft' self'@(MessageOptions x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 8 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeRep 2 11 x'5
             + P'.wireSizeExtField x'6
             + P'.wireSizeUnknownField x'7)
  wirePut ft' self'@(MessageOptions x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 8 x'1
             P'.wirePutOpt 16 8 x'2
             P'.wirePutOpt 24 8 x'3
             P'.wirePutOpt 56 8 x'4
             P'.wirePutRep 7994 11 x'5
             P'.wirePutExtField x'6
             P'.wirePutUnknownField x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{message_set_wire_format = Prelude'.Just new'Field}) (P'.wireGet 8)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{no_standard_descriptor_accessor = Prelude'.Just new'Field})
                    (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{deprecated = Prelude'.Just new'Field}) (P'.wireGet 8)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{map_entry = Prelude'.Just new'Field}) (P'.wireGet 8)
             7994 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{uninterpreted_option = P'.append (uninterpreted_option old'Self) new'Field})
                      (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in
                   if Prelude'.or [1000 <= field'Number && field'Number <= 18999, 20000 <= field'Number] then
                    P'.loadExtension field'Number wire'Type old'Self else P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> MessageOptions) MessageOptions where
  getVal m' f' = f' m'
 
instance P'.GPB MessageOptions
 
instance P'.ReflectDescriptor MessageOptions where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 56, 7994])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".google.protobuf.MessageOptions\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"MessageOptions\"}, descFilePath = [\"Text\",\"DescriptorProtos\",\"MessageOptions.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MessageOptions.message_set_wire_format\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MessageOptions\"], baseName' = FName \"message_set_wire_format\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MessageOptions.no_standard_descriptor_accessor\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MessageOptions\"], baseName' = FName \"no_standard_descriptor_accessor\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MessageOptions.deprecated\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MessageOptions\"], baseName' = FName \"deprecated\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MessageOptions.map_entry\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MessageOptions\"], baseName' = FName \"map_entry\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MessageOptions.uninterpreted_option\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MessageOptions\"], baseName' = FName \"uninterpreted_option\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 999}, wireTag = WireTag {getWireTag = 7994}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".google.protobuf.UninterpretedOption\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"UninterpretedOption\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [(FieldId {getFieldId = 1000},FieldId {getFieldId = 18999}),(FieldId {getFieldId = 20000},FieldId {getFieldId = 536870911})], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False}"
 
instance P'.TextType MessageOptions where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg MessageOptions where
  textPut msg
   = do
       P'.tellT "message_set_wire_format" (message_set_wire_format msg)
       P'.tellT "no_standard_descriptor_accessor" (no_standard_descriptor_accessor msg)
       P'.tellT "deprecated" (deprecated msg)
       P'.tellT "map_entry" (map_entry msg)
       P'.tellT "uninterpreted_option" (uninterpreted_option msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'message_set_wire_format, parse'no_standard_descriptor_accessor, parse'deprecated, parse'map_entry,
                   parse'uninterpreted_option])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'message_set_wire_format
         = P'.try
            (do
               v <- P'.getT "message_set_wire_format"
               Prelude'.return (\ o -> o{message_set_wire_format = v}))
        parse'no_standard_descriptor_accessor
         = P'.try
            (do
               v <- P'.getT "no_standard_descriptor_accessor"
               Prelude'.return (\ o -> o{no_standard_descriptor_accessor = v}))
        parse'deprecated
         = P'.try
            (do
               v <- P'.getT "deprecated"
               Prelude'.return (\ o -> o{deprecated = v}))
        parse'map_entry
         = P'.try
            (do
               v <- P'.getT "map_entry"
               Prelude'.return (\ o -> o{map_entry = v}))
        parse'uninterpreted_option
         = P'.try
            (do
               v <- P'.getT "uninterpreted_option"
               Prelude'.return (\ o -> o{uninterpreted_option = P'.append (uninterpreted_option o) v}))