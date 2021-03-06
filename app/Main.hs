module Main where

import Tactic
import Proof

-- check out tppa.v for a Coq style of proof

main :: IO ()
main = do f $ theorem "A ⇒ B ⇒ A"
          e $ repeatTac introTac
          e assumption
          topTheorem >>= print

          f $ theorem "A ⇒ (A ⇒ B) ⇒ B"
          e $ repeatTac introTac
          e $ elimTac $ theorem "A"
          e assumption
          e assumption
          topTheorem >>= print

          f $ theorem "A ⇒ (B ⇒ C) ⇒ (A ⇒ B) ⇒ C"
          e $ repeatTac introTac
          e $ elimTac $ theorem "B"
          e assumption
          e $ elimTac $ theorem "A"
          e assumption
          e assumption
          topTheorem >>= print

