import * as React from "react";

const CountContext = React.createContext({ count: 0, setCount: () => {} });

function CountProvider({ children }) {
  const [count, setCount] = React.useState(90);
  return (
    <CountContext.Provider
      value={{
        count,
        setCount,
      }}
    >
      {children}
    </CountContext.Provider>
  );
}

export { CountContext, CountProvider };
