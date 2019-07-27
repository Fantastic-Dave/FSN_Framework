resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
    "server/main.lua",
    "@fsn_main/sv_utils.lua",
}

client_scripts {
    "client/main.lua",
    "@fsn_main/cl_utils.lua",
}

ui_page {
    'html/ui.html',
}
files {
    'html/ui.html',
    'html/css/main.css',
    'html/js/app.js',
}