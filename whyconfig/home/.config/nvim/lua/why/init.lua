require("why/set")
require("why/packer")
require("why/remap")

vim.filetype.add({
    extension = {
        frag = "glsl",
        vert = "glsl",
        geom = "glsl",
        fsh = "glsl",
        vsh = "glsl",
        gsh = "glsl",
    },
    filename = {
        ["module-info.test"] = "java"
    }
})
