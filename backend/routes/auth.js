const express = require("express");
const router = express.Router();

const { login, register, emailRegistered } = require("../controllers/auth");

router.route("/login").post(login);
router.route("/exist/register").post(emailRegistered);
router.route("/register").post(register);

module.exports = router;
