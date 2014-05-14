import Data.Aeson
import Data.ByteString.Lazy hiding (head, map)
import Data.Map hiding (map)
import System.Environment
import Prelude hiding (readFile, take)
import Data.Binary
import Data.List.Split
import Control.Applicative

data DictEntry = DictEntry { dicStroke :: Word32
                           , dicFlags :: Word32
                           , dicParent :: Word32
                           , dicLeft :: Word32
                           , dicRight :: Word32
                           , dicRoot :: Word32
                           , dicLength :: Word32
                           , dicEntry :: ByteString
                           , dicNext :: Word32
                           }

stenoOrder = "STKPWHRAO*EUFRPBLGTSDZ"

main = do
  args <- getArgs
  dictionary <- readFile $ head args
  print $ dictSplit <$> (eitherDecode dictionary :: Either String (Map String String))

dictSplit :: Map String String -> [[String]]
dictSplit dict = map (splitOn "/") $ keys dict
