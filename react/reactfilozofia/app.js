const btn =document.createElement('button')
btn.onclick=function(){
    alert("Ez egy natív kód");
}
btn.innerHTML="Natív gomb"
document.getElementById("nativ-button-container").appendChild(btn);
 
const gomb = React.createElement("button",
{
    onclick:function()
    {
        alert("Ez egy react kód")
    },
},
"React gomb"
)
ReactDOM.render(gomb,documen.getElementById("react-button-container"));
//get, post, delete
//3 funkció és már értékelhető a feladat