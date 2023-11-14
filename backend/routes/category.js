const express = require("express");
const router = express.Router();
const { protect } = require("../middleware/authMiddleware");
const {
    createCategory,
    getCategory,
    getCategories,
    updateCategory,
    deleteCategory,
} = require("../controllers/category");

// routes start here
router
    .route("/")
    .get( getCategories)
    .post(createCategory);

router
    .route("/:id")
    .get(protect, getCategory)
    .put(protect, updateCategory)
    .delete(protect, deleteCategory);

module.exports = router;
