
local path = (...):gsub('%.[^%.]+$', '')

local Element = require(path .. ".element")



local function setParent(childElem, parentElem)
    table.insert(parentElem.children, childElem)
    childElem.parent = parentElem
end


local function assertParentValid(parent)
    if not parent then
        if parent == nil then
            error("Element not given parent! (if this is a root element, pass in `nil`)")
        end
        return -- parent=false, therefore its a root element
    end


    if type(parent) ~= "table" or (not parent.render) then
        error("Parent wasn't valid LUI element: " .. tostring(parent))
    end
end


local function initElement(elementClass, parent, ...)
    assertParentValid(parent)
    local element = setmetatable({}, elementClass)
    if parent then
        setParent(element, parent)
    end
    element:setup()
    if element.init then
        element:init(parent, ...)
    end
    return element
end


local ElementClass_mt = {
    __call = initElement,
    __index = Element
}


local function newElementClass()
    --[[
        two layers of __index here;
        when we do `element:myMethod()`,

        one __index to `elementClass`, (user-defined element,)
        then, __index to `Element`
    ]]
    local elementClass = {}
    elementClass.__index = elementClass
    setmetatable(elementClass, ElementClass_mt)

    return elementClass
end


return newElementClass

