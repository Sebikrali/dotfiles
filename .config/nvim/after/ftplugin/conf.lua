local fileExtension = vim.fn.expand("%:e")

if fileExtension == "vert" or fileExtension == "frag" then
	vim.opt.filetype = "glsl"
end
