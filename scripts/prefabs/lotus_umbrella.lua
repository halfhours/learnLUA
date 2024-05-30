local assets = {
    Asset("ANIM", "anim/lotus_umbrella.zip"),
    Asset("ANIM", "anim/swap_lotus_umbrella.zip"),
    Asset("ATLAS", "images/inventoryimages/lotus_umbrella.xml"),
}

local function fn()
    local inst = CreateEntity()
    
    inst.entity:AddTransform() -- 添加变换组件，一般只需要添加组件就行了
    inst.entity:AddAnimState() -- 添加动画组件
    inst.entity:AddNetwork() -- 添加网络组件

    MakeInventoryPhysics(inst) -- 设置物品拥有一般物品栏物体的物理特性，这是一个系统封装好的函数，内部已经含有对物理引擎的设置

    inst.AnimState:SetBank("lotus_umbrella") -- 设置动画属性 Bank lotus_umbrella
    inst.AnimState:SetBuild("lotus_umbrella") -- 设置动画属性 Build lotus_umbrella
    inst.AnimState:PlayAnimation("idle") -- 设置默认播放动画为idle

    inst.entity:SetPristine()
    -- 以下这几句是设置网络状态的，并且作为一个分界线，从这个if then 块往上是主客机通用代码，往下则是只限于主机使用的代码。
    if not TheWorld.ismastersim then
        return inst
    end

    return inst
end



return Prefab("lotus_umbrella", fn, assets)
