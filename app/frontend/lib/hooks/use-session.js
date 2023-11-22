import useLocalStorage from "react-use-localstorage";
import {useEffect, useState} from "react";
import {getRequest} from "~/lib/hooks/use-http";

export const useSession = () => {
  const [localstorageSession, setLocalstorageSession] = useLocalStorage('session');
  const [sessionInformation, setSessionInformation] = useState({
    loading: false,
    user: null
  });

  const session = JSON.parse(localstorageSession);
  useEffect(() => {
    if(!session && sessionInformation){
      return setSessionInformation({ user: null, loading: false });
    }
    if(!session) return

    setSessionInformation({loading: true, user: null})
    getRequest('/session').then(({data: { user }}) => {
      setSessionInformation({loading: false, user})
    }).catch(() => {
      setSessionInformation({loading: false, user: null})
    })
  }, [session?.id]);
  const setSession = (session) => {
    if(!session) return setLocalstorageSession(null)
    setLocalstorageSession(JSON.stringify(session))
  };

  return [session, setSession, sessionInformation];
}