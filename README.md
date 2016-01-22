# CYXCoreAnimationTest
Core Animation Test
[我的简书](http://www.jianshu.com/users/3f995dac0230/latest_articles)
###CABasicAnimation 基本动画
- 动画的本质就是修改图层的某些属性
- 核心动画,利用核心动画修改Layer某些属性
- 简介
    - 基本动画是`CAPropertyAnimation`的子类

- 属性说明：
    - `fromValue`：`keyPath`相应属性的初始值
    - `toValue`：`keyPath`相对应的结束值
- 动画过程说明：
    - 随着动画的进行，在长度为`duration`的持续时间内，`keyPath`相应的属性值从`fromValue`渐渐变为`toValue`
    - `keyPath`内容是`CALayer`的可动画`Animatable`属性
    - 如果`fillMode=kCAFillModeForwards`同时`removedOnComletion=NO`，那么在动画执行完毕后，图层会保持显示动画执行后的状态。。`但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。`
- 以下是代码实现步骤：
    - 1.创建基础核心动画
   ` CABasicAnimation *anim = [CABasicAnimation animation];`
    - 2.描述修改Layer的某个属性(@"transform.rotation"...)
    ` anim.keyPath = @"position”;`
    - 3.描述修改Layer属性的值
    - 动画的起点（如果不设，以默认值为终点）
    `anim.fromValue = @0`
    - 动画的终点
    ` anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 400)];`
    - 4.动画时长
    `anim.duration = 1;`
    - 5.取消反弹
        - (1)在动画完成的时候不要给我把动画销毁
        `anim.removedOnCompletion = NO;`
        - (2)动画永远保持最新的状态
        `anim.fillMode = kCAFillModeForwards;`
    - 6.添加核心动画
    `[_reaView.layer addAnimation:anim forKey:nil];`

###CAKeyframeAnimation——关键帧动画
- 简介
    - 关键帧动画，也是`CAPropertyAnimation`的子类，
    - 与`CABasicAnimation`的区别是：
        - `CABasicAnimation`只能从一个数值（`fromValue`）变到另一个数值（`toValue`），而`CAKeyframeAnimation`会使用一个`NSArray`保存这些数值
- 属性说明：
    - `values`：上述的NSArray对象。里面的元素称为“关键帧”(keyframe)。动画对象会在指定的时间（duration）内，依次显示values数组中的每一个关键帧
    - `path`：可以设置一个CGPathRef、CGMutablePathRef，让图层按照路径轨迹移动。path只对CALayer的anchorPoint和position起作用。`如果设置了path，那么values将被忽略`
    - `keyTimes`：可以为对应的关键帧指定对应的时间点，其取值范围为0到1.0，keyTimes中的每一个时间值都对应values中的每一帧。`如果没有设置keyTimes，各个关键帧的时间是平分的`

- `CABasicAnimation`可看做是只有2个关键帧的`CAKeyframeAnimation`

- 代码实现思路与步骤：
    - 1.初始化帧动画
        `CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];`
    - 2.描述修改layer的属性,
        - transform.rotation只能二维旋转
            `anim.keyPath = @"transform.rotation";`
        - position
            `anim.keyPath = @"position";`
    - 3.修改Layer值
        - `anim.values = @[@(angle2Radion(-5)),@(angle2Radion(5)),@(angle2Radion(-5))];`
        - 创建路径
        `UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:_imageView.center radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];`
    - 4.设置动画的属性值
        - 设置动画执行时间
        `anim.duration = 2;`
        - 动画执行次数
        `anim.repeatCount = MAXFLOAT;`
    - 5.添加动画到图层（Layer）
    `[_imageView.layer addAnimation:anim forKey:nil];`

###CAAnimationGroup——动画组
- 简介
    - 动画组，是`CAAnimation`的子类，可以保存一组动画对象，`将CAAnimationGroup`对象加入层后，组中所有动画对象可以`同时并发运行`

- 属性说明：
    - `animations`：用来保存一组动画对象的NSArray
默认情况下，一组动画对象是同时运行的，也可以通过设置动画对象的`beginTime`属性来更改动画的开始时间

###CATransition——转场动画
- 简介:
    - `CATransition`是`CAAnimation`的子类，用于做转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。iOS比Mac OS X的转场动画效果少一点
- `UINavigationController`就是通过`CATransition实现将控制器的视图推入(puch)屏幕的动画效果
- 动画属性:
    - `type`：动画过渡类型
    - `subtype`：动画过渡方向
    - `startProgress`：动画起点(在整体动画的百分比)
    - `endProgress`：动画终点(在整体动画的百分比)
- 代码实现思路与步骤：
    - `注意点`：
        - 只要切换界面 都可以使用转场动画
        - 谁切换界面 就添加到谁上
        - 转场动画代码必须和界面切换的代码放在一起
    - 1.写界面切换的代码（切换界面）
    ```objc
    //设置在touchBegin方法中
    static int i = 2;
    NSString *imageName = [NSString stringWithFormat:@"%d",i];
    _imageView.image = [UIImage imageNamed:imageName];
    i++;`
    ```
    - 2.初始化转场动画
    `CATransition *anim = [CATransition animation];`
    - 3.指定转场类型(其他样式见过度效果)
    `anim.type = @"pageCurl";`
    - 4.设置转场动画属性
        - (1)设置动画开始的进度
        `anim.startProgress = 0.5;`
        - (2)设置动画结束的进度
        `anim.endProgress = 0.8;`
        - (3)设置动画的时间
        `anim.duration = 3;`
    - 5.添加转场动画到图层
    `[_imageView.layer addAnimation:anim forKey:nil];`

####转场动画过渡效果


###CADisplayLink定时器
- `CADisplayLink`是一种以屏幕刷新频率触发的时钟机制，每秒钟执行大约60次左右，可以暂停`CADisplayLink`定时器
- `CADisplayLink`是一个计时器，可以使绘图代码与视图的刷新频率保持同步，而`NSTimer`无法确保计时器实际被触发的准确时间，无法暂停
- 使用方法：
    - 定义`CADisplayLink`并制定触发调用方法
    - 将显示链接添加到主运行循环队列

- 代码实现步骤：
    - 1.由于定时器只需要创建一次，因此定义为成员属性
    `@property (nonatomic, weak) CADisplayLink *link;`
    - 2.使用懒加载link属性

    ```objc
        - (CADisplayLink *)link
        {
            if (_link == nil) {

                //(1)定义CADisplayLink并制定触发调用方法
                CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];

                _link = link;

                //(2)加到主运行循环队列
                [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

            }
            return _link;
        }
    ```
    - 3.实现触发调用方法

        ```objc
        // 1秒调用60次 每次旋转45 / 60.0度
        - (void)timeChange
        {
            _wheelView.transform = CGAffineTransformRotate(_wheelView.transform, (45 / 60.0) / 180.0 * M_PI);
        }
        ```
    - 4.开启定时器
    `self.link.paused = NO;`(YES为暂停)
