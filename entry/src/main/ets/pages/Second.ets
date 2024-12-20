import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

/**
 * 测试第二个页面
 */
@Entry
@Component
struct Second {
  @State message: string = 'Hi there '


  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .newExtend()

      }.width('100%')
    }.height('100%')
  }
}

//@formatter:on
@Extend(Button)
function newExtend() {
  .backgroundColor('#0D9FFB')
  .width('40%')
  .height('5%')
  .onClick(() => {
    console.info(`Succeeded in clicking the 'Back' button.`);
    try {
      router.back();
      console.info('Succeeded in returning to the first page.');
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`);
    }
  })
}
