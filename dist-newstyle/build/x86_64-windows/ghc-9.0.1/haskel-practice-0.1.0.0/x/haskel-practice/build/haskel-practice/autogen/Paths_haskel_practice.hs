{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_haskel_practice (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\jezer\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\jezer\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\haskel-practice-0.1.0.0-inplace-haskel-practice"
dynlibdir  = "C:\\Users\\jezer\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1"
datadir    = "C:\\Users\\jezer\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\haskel-practice-0.1.0.0"
libexecdir = "C:\\Users\\jezer\\AppData\\Roaming\\cabal\\haskel-practice-0.1.0.0-inplace-haskel-practice\\x86_64-windows-ghc-9.0.1\\haskel-practice-0.1.0.0"
sysconfdir = "C:\\Users\\jezer\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskel_practice_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskel_practice_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskel_practice_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskel_practice_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskel_practice_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskel_practice_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
