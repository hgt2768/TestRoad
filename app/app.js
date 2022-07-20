// 기본
const express = require("express");
const app = express();
const path = require("path");
// 뷰 엔진
const ejs = require("ejs");
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views")); // views 경로 지정
// 미들웨어

// 라우터
const index = require("./routes/index.route");
app.use("/", index);
const register = require("./routes/register.route");
app.use("/", register);

// 정적 파일 제공
// path.join 사용시 하위 폴더 포함에서 모두 제공
app.use(express.static(path.join(__dirname, "views")));

module.exports = app;
