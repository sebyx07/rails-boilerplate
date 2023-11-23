import React, {useState, useEffect, useRef} from 'react';
import { Form, InputGroup } from 'react-bootstrap';

export const Search = ({ search, placeholder = 'Search...', className }) => {
  const [term, setTerm] = useState('');
  const { onSearch } = search
  const termInitialized = useRef(false)

  useEffect(() => {
    if(!termInitialized.current) {
      termInitialized.current = true
      return;
    }

    const delayDebounceFn = setTimeout(() => {
      onSearch(term);
    }, 200); // Delay for 500ms

    return () => clearTimeout(delayDebounceFn);
  }, [term]);

  return (
    <InputGroup>
      <Form.Control
        type="text"
        placeholder={placeholder}
        className={className}
        value={term}
        onChange={(e) => setTerm(e.target.value)}
      />
    </InputGroup>
  );
};
