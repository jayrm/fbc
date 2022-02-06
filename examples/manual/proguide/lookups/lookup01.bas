'' examples/manual/proguide/lookups/lookup01.bas
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
'' See Also: https://www.freebasic.net/wiki/wikka.php?wakka=ProPgIdentifierLookup
'' --------

Sub duplicateSub()
	Print "   ..duplicateSub"
End Sub

Namespace M
	Sub duplicateSub()
		Print "   M.duplicateSub"
	End Sub
End Namespace

Namespace N
	Sub duplicateSub()
		Print "   N.duplicateSub"
	End Sub
	Namespace P
		Using M
		Sub duplicateSub()
			Print "   N.P.duplicateSub"
		End Sub
		Sub test()
			Using M  '' useless, but just to demonstrate that does not increase priority level of imported namespace 
			duplicateSub()
		End Sub
	End Namespace
End Namespace

Print "From Namespace:"
' "N.P.test()" calls the unqualified identifier "duplicateSub"
' "N.P.duplicateSub()" calls the qualified identifier "N.P.duplicateSub"

N.P.test()               '' "N.P.duplicateSub" expected : in (1) current namespace/type
N.P.duplicateSub()       '' "N.P.duplicateSub" expected : in (1) current namespace/type

Print
Sleep
