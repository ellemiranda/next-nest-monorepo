import { CountProvider } from '../contexts/count-context'
import Counter from './components/counter/counter'

function HomePage() {
  return (
    <CountProvider>
      <Counter />
    </CountProvider>
  )
}

export default HomePage