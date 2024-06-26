let ctx;
let fire2 = new Audio("../sounds/fire2.wav");
let bgm = new Audio("../sounds/intospace.mp3");
let collisionSound = new Audio("../sounds/scream.wav");

let bgImg = new Image();
bgImg.src = "../images/space.jpg"

let bgImg2 = new Image();
bgImg2.src = "../images/space.jpg"

let ship1 = new Image();
ship1.src = "../images/gunship4.png"

let ship2 = new Image();
ship2.src = "../images/gunship5.png"

let ship3 = new Image();
ship3.src = "../images/gunship6.png"

let ship4 = new Image();
ship4.src = "../images/gunship7.png"

let enemyShip1_1 = new Image();
enemyShip1_1.src = "../images/gunship0.png"

let enemyShip1_2 = new Image();
enemyShip1_2.src = "../images/gunship1.png"

let enemyShip1_3 = new Image();
enemyShip1_3.src = "../images/gunship2.png"

let enemyShip1_4 = new Image();
enemyShip1_4.src = "../images/gunship3.png"

let enemyShip2_1 = new Image();
enemyShip2_1.src = "../images/gunship11.png"

let enemyShip2_2 = new Image();
enemyShip2_2.src = "../images/gunship12.png"

let enemyShip2_3 = new Image();
enemyShip2_3.src = "../images/gunship13.png"

let enemyShip2_4 = new Image();
enemyShip2_4.src = "../images/gunship14.png"

let enemyShip3_1 = new Image();
enemyShip3_1.src = "../images/gunship21.png"

let enemyShip3_2 = new Image();
enemyShip3_2.src = "../images/gunship22.png"

let enemyShip3_3 = new Image();
enemyShip3_3.src = "../images/gunship23.png"

let enemyShip3_4 = new Image();
enemyShip3_4.src = "../images/gunship24.png"

let missile1 = new Image();
missile1.src = "../images/missile1.png"

let missile2 = new Image();
missile2.src = "../images/missile1.png"

let bgY1 = 0;
let bgY2 = -800;

let shipX = 250;
let shipY = 600;

let missile1X = 250;
let missile1Y = 250;
let missile2X = 250;
let missile2Y = 250;

let missileArr = [];
let enemyArr = [];

let counter = 0;
let counter2 = 0;

let score = 0;
let isGameOver = false;

let canvas;

function startMusic(){
    console.log("배경음악 on");
    bgm.play();
}

function stopMusic(){
    console.log("배경음악 off");
    bgm.currentTime = 0;
    bgm.pause();
}

// 윈도창이 로딩되면 익명함수를 실행
window.onload = function(){
    canvas = document.getElementById("myCanvas");
    ctx = canvas.getContext("2d");
    canvas.onmousemove = moveShip;
    canvas.onmousedown = fireMissile;
    //게임이 중지된 상태에서
    let body = document.body;
    body.onkeydown = resetGame;
    
    window.setInterval(drawScreen, 40);
}

function moveShip(e){
    if(e.pageX > 30 && e.pageX < 570 && e.pageY > 30 && e.pageY < 770){
        shipX = e.pageX;
        shipY = e.pageY;
    }
}

function resetGame(e){
    if(isGameOver){
        if(e.keyCode == 88){
            isGameOver = false;
            canvas.onmousemove = moveShip;
            canvas.onmousedown = fireMissile;
            shipX = 250;
            shipY = 500;
            score = 0;
        }
    }
}

function drawScreen(){
    ctx.drawImage(bgImg, 0, bgY1, 600, 800);
    ctx.drawImage(bgImg2, 0, bgY2, 600, 800);
    bgY1 += 5;
    bgY2 += 5;
    if(bgY1 >= 800){
        bgY1 = -800;
        bgY2 = 0;
    }
    if(bgY2 >= 800){
        bgY2 = -800;
        bgY1 = 0
    }

    counter++;
    if(counter % 50 == 0){
        makeEnemy();
    }
    if(counter % 4 == 1){
        ctx.drawImage(ship1, shipX-25, shipY-25, 50, 50);
    }else if(counter % 4 == 2){
        ctx.drawImage(ship2, shipX-25, shipY-25, 50, 50);
    }else if(counter % 4 == 3){
        ctx.drawImage(ship3, shipX-25, shipY-25, 50, 50);
    }else{
        ctx.drawImage(ship4, shipX-25, shipY-25, 50, 50);
    }
    
    for(let i = 0 ; i < missileArr.length ; i++){
        let m = missileArr[i];
        ctx.drawImage(missile1, m.x, m.y, 5, 20);
        m.y -= 25;
        if(m.y < -100){
            missileArr.shift();
        }
    }
    for(let i = 0 ; i < enemyArr.length ; i++){
        let e = enemyArr[i]
        if(e.type == 1){
            if(counter % 4 == 1){
            ctx.drawImage(enemyShip1_1, e.x, e.y, 50, 50);
            }else if(counter % 4 == 2){
                ctx.drawImage(enemyShip1_2, e.x, e.y, 50, 50);
            }else if(counter % 4 == 3){
                ctx.drawImage(enemyShip1_3, e.x, e.y, 50, 50);
            }else{
                ctx.drawImage(enemyShip1_4, e.x, e.y, 50, 50);
            } 
        }else if(e.type ==2 ){
            if(counter % 4 == 1){
            ctx.drawImage(enemyShip2_1, e.x, e.y, 50, 50);
            }else if(counter % 4 == 2){
                ctx.drawImage(enemyShip2_2, e.x, e.y, 50, 50);
            }else if(counter % 4 == 3){
                ctx.drawImage(enemyShip2_3, e.x, e.y, 50, 50);
            }else{
                ctx.drawImage(enemyShip2_4, e.x, e.y, 50, 50);
            }
        }else {
            if(counter % 4 == 1){
            ctx.drawImage(enemyShip3_1, e.x, e.y, 50, 50);
            }else if(counter % 4 == 2){
                ctx.drawImage(enemyShip3_2, e.x, e.y, 50, 50);
            }else if(counter % 4 == 3){
                ctx.drawImage(enemyShip3_3, e.x, e.y, 50, 50);
            }else{
                ctx.drawImage(enemyShip3_4, e.x, e.y, 50, 50);
            }
        }
       
        e.y += 3;

        //적 우주선이 화면 밖으로 나가면 제거
        if(e.y > 950){
            enemyArr.shift();
        }
    }
    checkCollision();
    checkCollision2();
    ctx.fillStyle = "red";
    ctx.font = "30px 고딕";
    ctx.fillText("SCORE : " + score, 230, 50);

    if(isGameOver){
        ctx.font = "90px 고딕"
        ctx.fillText("GAME OVER", 50, 300)
        ctx.font = "30px 고딕"
        ctx.fillText("Please Insert Coin", 185, 400)
    }
}
function fireMissile(e){
    counter2++;
    fire2.play();
    if(counter2%2 == 1){
        missile1X = shipX - 25;
        missile1Y = shipY;
        let m = {
            x : missile1X,
            y : missile1Y
        }  
        missileArr.push(m);
    }else{
        missile2X = shipX + 25;
        missile2Y = shipY;
        let n = {
            x : missile2X,
            y : missile2Y
        }
        missileArr.push(n); 
    }
    
    
}
function makeEnemy(){
    let xArr = [];
    for(let i = 0 ; i < Math.floor(Math.random()*4) + 1 ; i++){
        let enemyX = Math.floor(Math.random()*500)+50;
        for(let j = 0 ; j < xArr.length ; j++){
            if(!enemyX < xArr[i] + 30 && enemyX > xArr[i] - 30){
                xArr.push(enemyX);
            }
        }
        let enemyY = Math.floor(Math.random()*50) - 100;
        // 적 우주선의 타입을 랜덤으로 생성
        // 1. 일반 적 우주선
        // 2. 노랑 적 우주선
        // 3. 파랑 적 우주선
        let t = Math.floor(Math.random()*3) + 1
        let e = {
            x : enemyX,
            y : enemyY,
            type : t,
            hp : t*100
        }
        enemyArr.push(e);
    }
}
function pythagoras(x1, y1, x2, y2){
    return Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
}
function checkCollision(){
    for(let i = 0 ; i < enemyArr.length ; i++){
        let e = enemyArr[i];
        for(let j = 0 ; j < missileArr.length ; j++){
            let m = missileArr[j];
            if(pythagoras(e.x, e.y, m.x, m.y) < 50){
                console.log("충돌!")
                m.x = -100;
                collisionSound.currentTime = 0;
                collisionSound.play();
                e.hp -= 100;
                e.y -= 20;
                score += 10;
                if(e.hp <= 0){
                     e.x = 800;
                     score += e.type * 100
                }
            }
        }
    }
}
function checkCollision2(){
    for(let i = 0 ; i < enemyArr.length ; i++){
        let e = enemyArr[i];
        if(pythagoras(e.x, e.y, shipX, shipY) < 35){
            isGameOver = true;
            gameOver();
        }
    }
}
function gameOver(){
    shipX = -100;
    canvas.onmousemove = '';
    canvas.onmousedown = '';
}