import {Nav, NavDropdown} from "react-bootstrap";
import {useApplicationContext} from "@/application/components/application";
import {Link} from "react-router-dom";
import {deleteRequest} from '~/lib/hooks/use-http'

export const NavbarUserSession = () => {
  const {sessionInformation: { loading, user }, setSession} = useApplicationContext()

  if(!loading && !user){
    return (
      <Nav.Item>
        <Link to='/sign-in' className='nav-link'>Sign in</Link>
      </Nav.Item>
    )
  }

  if(loading){
    return(
      <Nav.Link href="">...</Nav.Link>
    )
  }

  function signOut(e){
    e.preventDefault()
    setSession(null)
    return deleteRequest('/session')
  }

  return(
    <NavDropdown title={user.email} id="basic-nav-dropdowny">
      <NavDropdown.Item href="#sign-out" onClick={signOut}>Sign out</NavDropdown.Item>
    </NavDropdown>
  )
}