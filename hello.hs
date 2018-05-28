module Main where

import           Control.Monad
import           Foreign.C.Types
import           System.Environment

foreign import ccall unsafe current_timestamp :: IO CLLong

foreign import ccall unsafe plusone :: CInt -> CInt

run :: CInt -> IO ()
run count = do
  start <- current_timestamp
  let
    go x =
      when (x < count) (go (plusone x))
  go 0
  end <- current_timestamp
  print (end - start)

main :: IO ()
main = do
  args <- getArgs
  if null args
  then putStrLn "First arg (0 - 2000000000) is required."
  else do
    let count = read (head args)
    if count <= 0 || count > 2000000000
    then putStrLn "Must be a positive number not exceeding 2 billion."
    else run count
