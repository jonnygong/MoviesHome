function showMessage(t,message)
{
    //  pos为位置值，正上方为0，顺时针+1，中间为8
    $.messager.show({
        title:t,
        msg:message,
        showType:'fade',
        style:{
            right:'',
            bottom:''
        }
    });
} 

function showMessageRightTop(t,message)
{
    //  pos为位置值，正上方为0，顺时针+1，中间为8
    $.messager.show({
        title:t,
        msg:message,
        showType:'fade',
        style:{
			left:'',
			right:0,
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
    });
}  

function changeStyle(obj,newstyle)
{
    obj.className=newstyle;
}  