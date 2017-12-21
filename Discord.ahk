#SingleInstance,Force
DebugWindow("More things",1)
MyFunction(a,b,c,d,e,f,g)


MyFunction(a,b,c,d,e,f,g){
	a:=1,b:=2,c:=4,d:=3
	if(m("Do you want to quit?","btn:ync","def:2","ico:!")="Yes")
		m("You clicked Yes")
	DebugWindow(a "`n" b "`n" c "`n" d,0,1)
}
Menus:=x.Get("Menus")
/*
	m(Menus.SN("//menu").length)
*/
DebugWindow("Done")
ExitApp
A_Thing(){
	MsgBox,hello
}
DebugWindow(Text,Clear:=0,LineBreak:=0,Sleep:=0,AutoHide:=0,MsgBox:=0){
	x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}"),x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide,MsgBox)
}
m(x*){
	static list:={btn:{oc:1,ari:2,ync:3,yn:4,rc:5,ctc:6},ico:{"x":16,"?":32,"!":48,"i":64}},msg:=[]
	list.title:="AHK Studio",list.def:=0,list.time:=0,value:=0,txt:=""
	for a,b in x
		obj:=StrSplit(b,":"),(vv:=List[obj.1,obj.2])?(value+=vv):(list[obj.1]!="")?(List[obj.1]:=obj.2):txt.=b "`n"
	msg:={option:value+262144+(list.def?(list.def-1)*256:0),title:list.title,time:list.time,txt:txt}
	Sleep,120
	MsgBox,% msg.option,% msg.title,% msg.txt,% msg.time
	for a,b in {OK:value?"OK":"",Yes:"YES",No:"NO",Cancel:"CANCEL",Retry:"RETRY"}
		IfMsgBox,%a%
			return b
}