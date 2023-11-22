import { Navbar as NavbarBoostrap, Container, Nav, NavDropdown } from "react-bootstrap";
import {NavbarUserSession} from "@/application/components/page/navbar/navbar-user-session";
import {Link} from "react-router-dom";

export const Navbar = () => {
  return(
    <NavbarBoostrap expand="lg" variant='dark' className='bg-primary fixed w-full'>
      <Container>
        <NavbarBoostrap.Brand>
          <Link to='/' className='no-underline'>Rails Boilerplate</Link>
        </NavbarBoostrap.Brand>
        <NavbarBoostrap.Toggle aria-controls="basic-navbar-nav" />
        <NavbarBoostrap.Collapse id="basic-navbar-nav">
          <Nav className="ml-auto">
            <Nav.Link href="#home">Home</Nav.Link>
            <Nav.Link href="#link">Link</Nav.Link>
            <NavbarUserSession/>
          </Nav>
        </NavbarBoostrap.Collapse>
      </Container>
    </NavbarBoostrap>
  )
}