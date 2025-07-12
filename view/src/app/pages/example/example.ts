// 导入 Angular 核心模块。
// - ChangeDetectionStrategy: 用于设置组件的变更检测策略。OnPush 是一种性能优化策略。
// - Component: 用于定义组件元数据的装饰器。
import { ChangeDetectionStrategy, Component } from '@angular/core';

// @Component 装饰器，用于将一个类标记为 Angular 组件，并提供关于该组件的元数据。
@Component({
  // selector: 组件在 HTML 中使用的标签名。例如: <app-example></app-example>
  selector: 'app-example',
  // standalone: true 表示这是一个独立组件，它不属于任何 NgModule，并自己管理其依赖。
  standalone: true,
  // imports: 用于导入该组件模板中需要的其他独立组件、指令或管道。
  imports: [],
  // templateUrl: 指向组件的 HTML 模板文件。
  templateUrl: './example.html',
  // styleUrls: 一个包含组件样式文件路径的数组。
  styleUrls: ['./example.scss'],
  // changeDetection: 设置变更检测策略。OnPush 意味着只有当组件的输入属性 (@Input) 发生变化，
  // 或组件内部及其子组件触发事件时，才会进行变更检测，这可以显著提升性能。
  changeDetection: ChangeDetectionStrategy.OnPush,
})
// 导出组件类，以便在其他地方（如路由配置中）导入和使用。
// 'default' 关键字使得在导入时可以省略花括号，例如: import ExampleComponent from './pages/example/example';
export default class ExampleComponent {}
