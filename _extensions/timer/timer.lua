quarto.doc.add_html_dependency({
  name = "quarto-timer",
  version = "1.0.0",
  scripts = {"timer.js"},
  stylesheets = {"timer.css"}
})

return {
    -- Füge den Filter zu Pandoc hinzu
    {
        Div = function (div)
            if div.classes[1] == "timer" then
                local containerId = div.identifier
                local timeLimit = tonumber(div.attributes["seconds"]) or 300  -- Default: 300 Sekunden
                local startOn = div.attributes["starton"] or "slide" -- Default: timers run when visible
                local size = div.attributes["size"] or "100%" -- Default: 100%
                local sound = div.attributes["sound"] or "false" -- Default: kein Sound
            
                local htmlSnippet = string.format([[
                    <div id="%s"></div>
                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            initializeTimer("%s", %d, "%s", "%s", "%s");
                        });
                    </script>
                ]], containerId, containerId, timeLimit, startOn, size, sound)

                return pandoc.RawBlock("html", htmlSnippet)
            end
            return div
        end
    }
}
