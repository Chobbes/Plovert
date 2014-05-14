import Data.Aeson
import Data.ByteString.Lazy hiding (head)
import Data.Map
import System.Environment
import Prelude hiding (readFile, take)

main = do
  args <- getArgs
  dictionary <- readFile $ head args
  print $ (eitherDecode dictionary :: Maybe String (Map String String))
