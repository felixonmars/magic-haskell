{-# OPTIONS -fallow-overlapping-instances #-}

{- arch-tag: BZip2 files
Copyright (C) 2005 John Goerzen <jgoerzen@complete.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-}

{- |
   Module     : MissingPy.FileArchive.BZip2
   Copyright  : Copyright (C) 2005 John Goerzen
   License    : GNU GPL, version 2 or above

   Maintainer : John Goerzen,
   Maintainer : jgoerzen@complete.org
   Stability  : provisional
   Portability: portable

Support for BZip2 files

Written by John Goerzen, jgoerzen\@complete.org
-}

module MissingPy.FileArchive.BZip2 (openBz2)
where

import Python.Types
import Python.Utils
import Python.Objects
import Python.Interpreter
import System.IO
import System.IO.Error
import Python.Exceptions
import MissingH.IO.HVIO
import Foreign.C.Types
import Python.Objects.File

{- |Open a BZip2 file.  The compression level should be from 1
(least compression) to 9 (most compression).  This is ignored when the file
is opened read-only.

Once opened, the functions defined in 'MissingH.IO.HVIO' can be used
to work with it. -}
openBz2 :: FilePath             -- ^ File to open
        -> IOMode               -- ^ Mode to open with
        -> Int                  -- ^ Compression Level
        -> IO PyFile            -- ^ Resulting handle
openBz2 fp mode level =
    do ofp <- toPyObject fp
       omode <- toPyObject (openModeConv mode)
       obuffering <- toPyObject (0::CLong)
       ocl <- toPyObject ((fromIntegral level)::CLong)
       pyImport "bz2"
       obj <- callByName "bz2.BZ2File" [ofp, omode, obuffering, ocl] []
       return $ mkPyFile obj
