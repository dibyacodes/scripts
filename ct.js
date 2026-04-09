import crypto from "crypto";

function generate64BitToken() {
  const token = crypto.randomBytes(64).toString("hex");
  return token;
}

console.log(generate64BitToken())
