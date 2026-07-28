{-# LANGUAGE OverloadedStrings #-}
import Pandoc (AST(..), Heading(..), Block(..))
import qualified Data.Text as T
import Control.Monad (forM_)

main :: IO ()
main = do
    content <- hGetContents
    case parsePandoc content of
        Right ast -> do
            let titles = filterTodoHeadlines ast
            forM_ titles $ \t -> putStrLn (T.unpack t)
        Left err -> putStrLn $ "Error parsing document: " ++ show err

filterTodoHeadlines :: AST -> [Text]
filterTodoHeadlines ast = concatMap go (astBlocks ast)
  where
    go (HBlock blocks) = concatMap go blocks
    go (PBlock blocks) = concatMap go blocks
    go (CBlock blocks) = concatMap go blocks
    go (MergedBlock b) = go b
    go (Plain _) = []
    go (Str _) = []
    go (Space) = []
    go (LineBreak) = []
    go (Blank) = []
    go (Heading _ title tags) = if "AL-TODO" `elem` tags then [title] else []
