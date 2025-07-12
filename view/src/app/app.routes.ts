import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'home',
  },
  {
    path: 'home',
    loadComponent: () => import('./pages/home/home'),
  },
  {
    path: 'mvianav',
    loadComponent: () => import('./pages/mvianav/mvianav'),
  },
  {
    path: 'example',
    loadComponent: () => import('./pages/example/example'),
  },
];
