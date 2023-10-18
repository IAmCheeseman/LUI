

local Menu = LUI.Element()


function Menu:init()
    self.button = elements.Button(self, {
        text = "Button!"
    })
    
    self.flex = elements.FlexBox(self, {
        elements.Text(false, "Hello!"),
        elements.Text(false, "This element is a FlexBox"),
        elements.Text(false, "It will expand to automatically to fit content."),
        elements.Text(false, "We can put anything we want in here."),
        elements.Button(false, {
            text = "Like a button. Clicks: 0",
            onClick = function(butto)
                butto.count = (butto.count or 0) + 1
                butto.text = "Like a button! Clicks: " .. butto.count
            end
        })
    })

    self.text = elements.Text(self, {
        text = "hi"
    })
end


function Menu:onRender(x,y,w,h)
    local region = Region(x,y,w,h)
    local header, left, right

    header, region = region:splitVertical(0.2, 0.8)
    left, right = region:pad(16):splitHorizontal(0.5, 0.5)
    
    mainStyle:rectangle(header:get())
    self.text:render(header:get())

    do
    local prefW, prefH = self.flex:getPreferredSize()
    local r = right
    local flexR = right:shrinkTo((prefW or r.w), (prefH or r.h))
    mainStyle:rectangle(flexR:get())
    self.flex:render(flexR:get())
    end
end


return Menu
