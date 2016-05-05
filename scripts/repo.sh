# Initial Directory

mkdir ~/Projects/
cd ~/Projects/

# OSS Projects
clone_oss () {
  mkdir oss
  cd oss

  for r in (justafewicons, typothetical, obsidian, type-findings, cercyon, hephaestus, thunder, davatron5000/FitText.js)
  do
    hub clone "$r"
  done
}

# Sandboxes
cd ~/Projects/
mkdir sandbox
cd sandbox

hub clone basscss/basscss
hub clone mrmrs/tachyons
hub clone daneden/animate.css
hub clone sheetify/sheetify
hub clone callmecavs/layzr.js
hub clone gionkunz/chartist-js
hub clone airbnb/javascript
hub clone andyet/yeti.css
hub clone google/web-starter-kit
hub clone salesforce-ux/theo

# Private repositories need to be done manually?
# Personal Projects
clone_personal () {
  cd ~/Projects/
  mkdir personal
  cd personal

  hub clone arwhd
  hub clone charlespeters.github.io charlespeters
  hub clone viewsources/viewsources.github.io viewsources
  hub clone sabrinapeters/sabrinapeters.github.io sabrina
}

# Apps
cd ~/Projects/
mkdir apps
cd apps
hub clone withdraws
hub clone downwrite
