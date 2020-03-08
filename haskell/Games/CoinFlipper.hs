import MicroBit

led :: MicroBit
led = 
    let a = showIcon $ return SmallDiamond in 
    let b = showIcon $ return Diamond in 
    let c = showIcon $ return (if randomBoolean then Yes else No) in 
    a >> b >> a >> b >> c
