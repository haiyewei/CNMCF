# 框架页面模板说明

`example` 目录提供了一个创建新页面的标准基础模板。

## 模板文件

一个标准页面组件由以下三个核心文件组成，每个文件都包含了详细的中文注释以解释其作用：

- `example.ts`: TypeScript 文件，用于定义组件的元数据和类。
- `example.html`: HTML 文件，用于构建页面的视图结构。
- `example.scss`: SCSS 文件，用于定义页面的封装样式。

## 如何使用模板创建新页面

**复制目录**:
复制整个 `src/app/pages/example` 目录，并将其重命名为您想要的页面名称（例如，`my-new-page`）。

**修改文件内容**:
进入新创建的 `my-new-page` 目录，并对文件进行如下修改：- **`my-new-page.ts`**: - 将 `selector` 从 `'app-example'` 修改为 `'app-my-new-page'`。- 将类名从 `ExampleComponent` 修改为 `MyNewPageComponent`。- 确保 `templateUrl` 和 `styleUrls` 指向正确的文件名 (`./my-new-page.html` 和 `./my-new-page.scss`)。- **`my-new-page.html`**: - 根据您的需求修改 HTML 结构。- **`my-new-page.scss`**: - 根据您的需求添加或修改样式。

**在路由中注册页面**:
打开 `src/app/app.routes.ts` 文件，在 `routes` 数组中添加一个新的路由对象来注册您的新页面：

    ```typescript
    {
      path: 'my-new-page', // URL路径
      loadComponent: () => import('./pages/my-new-page/my-new-page'), // 懒加载组件
    }
    ```

**添加入口链接 (可选)**:
如果需要在主导航栏中添加一个直接访问新页面的链接，请打开 `src/app/app.html` 并添加一个 `<a>` 标签：

    ```html
    <a routerLink="/my-new-page">My New Page</a
    ```
