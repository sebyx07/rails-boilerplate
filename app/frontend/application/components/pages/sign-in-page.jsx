import {Alert, Button, Card, Form} from "react-bootstrap";
import {useEffect, useState} from "react";
import {postRequest} from "~/lib/hooks/use-http";
import {useApplicationContext, useAppNavigation} from "@/application/components/application";

const SignInPage = () => {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState(null)
  const {session, setSession} = useApplicationContext()
  const { navigate } = useAppNavigation()

  useEffect(() => {
    if(!session) return
    navigate('/')
  }, [session]);

  const submit = async (e) => {
    e.preventDefault()
    setError(null)
    setLoading(true)
    try{
      const { data: { user }} = await postRequest('/session', {
        session: {
          email, password
        }
      })
      setSession(user)
    }catch ({response: { data: { error }}}) {
      setError(error)
    }finally {
      setLoading(false)
    }
  }

  return(
    <Card className='w-full md:w-1/2 mx-auto p-4 bg-dark'>
      <h1 className='text-center'>Sign in</h1>
      <Form onSubmit={submit}>
        <Alert show={!!error} variant='danger'>
          <Alert.Heading>Error</Alert.Heading>
          <p>
            {error}
          </p>
        </Alert>
        <Form.Group controlId="formBasicEmail">
          <Form.Label>Email address</Form.Label>
          <Form.Control type="email" placeholder="Enter email" required={true}
                        value={email} onChange={(e) => setEmail(e.target.value)}
          />
        </Form.Group>

        <Form.Group controlId="formBasicPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" placeholder="Password" required={true}
                        value={password} onChange={(e) => setPassword(e.target.value)}
          />
        </Form.Group>

        <Button type="submit" variant="outline-primary" className='mt-10 w-full' disabled={loading}>
          Sign In
        </Button>
      </Form>
    </Card>
  )
}

export default SignInPage