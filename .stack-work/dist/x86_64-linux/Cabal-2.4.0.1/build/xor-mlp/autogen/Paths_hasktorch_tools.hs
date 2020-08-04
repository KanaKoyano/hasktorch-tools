{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hasktorch_tools (
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

bindir     = "/home/acc12244ze/hasktorch-tools/.stack-work/install/x86_64-linux/a2d6b7dc3d7431c4b55bc6b4a427b57401c1be5fe91909019b0168b0a245f6da/8.6.5/bin"
libdir     = "/home/acc12244ze/hasktorch-tools/.stack-work/install/x86_64-linux/a2d6b7dc3d7431c4b55bc6b4a427b57401c1be5fe91909019b0168b0a245f6da/8.6.5/lib/x86_64-linux-ghc-8.6.5/hasktorch-tools-0.1.0.0-655KndX8yxSJ75dIDDUZls-xor-mlp"
dynlibdir  = "/home/acc12244ze/hasktorch-tools/.stack-work/install/x86_64-linux/a2d6b7dc3d7431c4b55bc6b4a427b57401c1be5fe91909019b0168b0a245f6da/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/acc12244ze/hasktorch-tools/.stack-work/install/x86_64-linux/a2d6b7dc3d7431c4b55bc6b4a427b57401c1be5fe91909019b0168b0a245f6da/8.6.5/share/x86_64-linux-ghc-8.6.5/hasktorch-tools-0.1.0.0"
libexecdir = "/home/acc12244ze/hasktorch-tools/.stack-work/install/x86_64-linux/a2d6b7dc3d7431c4b55bc6b4a427b57401c1be5fe91909019b0168b0a245f6da/8.6.5/libexec/x86_64-linux-ghc-8.6.5/hasktorch-tools-0.1.0.0"
sysconfdir = "/home/acc12244ze/hasktorch-tools/.stack-work/install/x86_64-linux/a2d6b7dc3d7431c4b55bc6b4a427b57401c1be5fe91909019b0168b0a245f6da/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hasktorch_tools_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hasktorch_tools_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hasktorch_tools_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hasktorch_tools_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hasktorch_tools_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hasktorch_tools_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
