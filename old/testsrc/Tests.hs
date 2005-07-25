{- arch-tag: Tests main file
Copyright (C) 2004 - 2005 John Goerzen <jgoerzen@complete.org>

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

module Tests(tests) where
import Test.HUnit
import qualified Interpretertest
import qualified Objectstest
import qualified Exceptionstest
import qualified GZiptest
import qualified BZip2test
import qualified Dicttest
import qualified AnyDBMPytest

test1 = TestCase ("x" @=? "x")

tests = TestList [TestLabel "test1" test1,
                  TestLabel "objects" Objectstest.tests,
                  TestLabel "interpreter" Interpretertest.tests,
                  TestLabel "exceptions" Exceptionstest.tests,
                  TestLabel "AnyDBM/Dict" Dicttest.tests,
                  TestLabel "AnyDBM/dbm" AnyDBMPytest.tests,
                  TestLabel "bzip2" BZip2test.tests,
                  TestLabel "gzip" GZiptest.tests
                 ]



