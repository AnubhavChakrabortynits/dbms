const express = require("express");
const multer = require("multer");
const path = require("path");

const router = express.Router();

var filename;
const storage = multer.diskStorage({
    destination(req, file, cb) {
        cb(null, "uploads/");
    },
    filename(req, file, cb) {
        filename = `${file.fieldname}-${Date.now()}${path.extname(
            file.originalname
        )}`;
        cb(null, filename);
    },
});

function checkFileType(file, cb) {
    const filetypes = /jpg|jpeg|png/;
    const extname = filetypes.test(
        path.extname(file.originalname).toLowerCase()
    );
    const mimetype = filetypes.test(file.mimetype);

    if (extname && mimetype) {
        return cb(null, true);
    } else {
        cb("Images only");
    }
}

//upload image
const upload = multer({
    storage,
    fileFilter: function (req, file, cb) {
        checkFileType(file, cb);
    },
});

router.post("/", upload.single("image"), (req, res) => {
    res.send(`/${req.file.path}`);
});

module.exports = router;
