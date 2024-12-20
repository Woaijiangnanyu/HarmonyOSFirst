import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(()=> {
          console.info('Succeeded in clicking the \'Next\' button.')
          router.pushUrl({ url: 'pages/Second' }).then(()=> {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err:BusinessError)=> {
            console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
          })
        })
      }.width('100%')
    }.height('100%')
  }
}

class Foo {
  static bar() {}
}

Foo.bar();

class foo {    //此处构造一个命名风格错误的示例，foo为错误使用类名，正确类名应为Foo
  bar() {}
}

@Component
struct Title {
  @Prop context: string;
  build() {
    Text(this.context)
  }
}

@Preview
@Component    //定义组件片段TitlePreview
struct TitlePreview {
  build() {
    Title({ context: 'MyTitle' })    //在该片段中声明将要预览的组件Title，以及该组件依赖的入参 {context: 'MyTitle'}
  }
}