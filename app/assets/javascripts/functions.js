function redirect() {
    setTimeout(function() {
        document.getElementById('voltar').click();
    }, 5000);
}

function link (url) {
    window.location.href = url
}

function validar()
{
    var i;
    var marcou = false;
    for (i=0;i<document.quest.alternativa.length;i++){
        if (document.quest.alternativa[i].checked) marcou = true;
    }
    if (!marcou) {
        $('.alerta').fadeIn();
        setTimeout(function(){
            $('.alerta').fadeOut();
        }, 3000);
    }
    return marcou;
}

function validar_acesso() {

    if ($("#re").val()=='') {
        return false;
    }
    return true;
}

var posicao = 1;
function escolher() {
    posicao = Math.floor(Math.random() * $('#total_pessoas').val());
    if (posicao==0) posicao = posicao + 1;
    $('#sorteado').html($('#posicao_' + posicao).attr('nome'));
}

function sortear() {
    posicao = Math.floor(Math.random() * $('#total_pessoas').val());
    temporizador = setInterval(escolher, 95);
    setTimeout(function(){
        clearInterval(temporizador);
    }, 5000);
}