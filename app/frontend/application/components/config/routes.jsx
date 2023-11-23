import { Routes as ReactRoutes, Route } from 'react-router-dom'
import {createContext, lazy, Suspense} from "react";
const HomePage = lazy(() => import('../pages/home-page.jsx'));
const SignInPage = lazy(() => import('../pages/sign-in-page.jsx'));

export const Routes = () => {
  return(
    <Suspense fallback={<div>Loading...</div>}>
      <ReactRoutes>
        <Route path='/' element={<HomePage/>} />
        <Route path='/sign-in' element={<SignInPage/>} />
      </ReactRoutes>
    </Suspense>
  )
}
