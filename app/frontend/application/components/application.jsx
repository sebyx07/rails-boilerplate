import {createContext, startTransition, useContext} from "react";
import {Routes} from "~/application/components/config/routes";
import {Navbar} from "~/application/components/page/navbar";
import {Footer} from "~/application/components/page/footer";
import {BrowserRouter, useNavigate} from "react-router-dom";
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import {Container} from "react-bootstrap";
import {useSession} from "@/lib/hooks/use-session";

const WrappedApplication = () => {
  const navigateRouter = useNavigate();

  const navigate = (path) => {
    startTransition(() => {
      navigateRouter(path);
    });
  };

  return (
    <NavigationContext.Provider value={{navigate}}>
      <Navbar/>
      <div className='min-h-screen flex flex-col justify-between'>
        <Container className='pt-20'>
          <Routes/>
        </Container>
        <Footer/>
      </div>
    </NavigationContext.Provider>
  )
}

const ApplicationContext = createContext({})
const NavigationContext = createContext({})
export const useApplicationContext = () => useContext(ApplicationContext)
export const useAppNavigation = () => useContext(NavigationContext)

export const Application = () => {
  const [session, setSession, sessionInformation] = useSession()

  return (
    <ApplicationContext.Provider value={{session, setSession, sessionInformation}}>
      <ThemeProvider>
        <BrowserRouter>
          <WrappedApplication />
        </BrowserRouter>
      </ThemeProvider>
    </ApplicationContext.Provider>
  )
}