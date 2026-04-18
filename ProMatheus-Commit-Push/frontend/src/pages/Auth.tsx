import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Auth() {
    const [isLogin, setIsLogin] = useState(true);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [name, setName] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        
        try {
            let response;
            
            if (isLogin) {
                const loginData = { email, password };
                
                response = await fetch('http://localhost:5000/api/auth/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(loginData)
                });
            } else {
                const registerData = { name, email, password };
                
                response = await fetch('http://localhost:5000/api/auth/register', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(registerData)
                });
            }
            
            const data = await response.json();
            
            if (response.ok && data.success) {
                localStorage.setItem('userId', data.user.id.toString());
                localStorage.setItem('userName', data.user.name);
                navigate('/handler');  // 👈 НА СТРАНИЦУ НАСТРОЙКИ, а не сразу в handler
            } else {
                setError(data.error || 'Ошибка авторизации');
            }
        } catch (err) {
            setError('Ошибка соединения с сервером');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div style={containerStyle}>
            <div style={formContainerStyle}>
                <h2 style={titleStyle}>{isLogin ? 'Вход' : 'Регистрация'}</h2>
                {error && <div style={errorStyle}>{error}</div>}
                <form onSubmit={handleSubmit}>
                    {!isLogin && (
                        <input
                            type="text"
                            placeholder="Имя пользователя"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            required
                            style={inputStyle}
                        />
                    )}
                    <input
                        type="email"
                        placeholder="Email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        required
                        style={inputStyle}
                    />
                    <input
                        type="password"
                        placeholder="Пароль"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        required
                        style={inputStyle}
                    />
                    <button type="submit" disabled={loading} style={buttonStyle}>
                        {loading ? 'Загрузка...' : (isLogin ? 'Войти' : 'Зарегистрироваться')}
                    </button>
                </form>
                <button onClick={() => { setIsLogin(!isLogin); setError(''); setName(''); setEmail(''); setPassword(''); }} style={linkButtonStyle}>
                    {isLogin ? 'Нет аккаунта? Зарегистрироваться' : 'Уже есть аккаунт? Войти'}
                </button>
            </div>
        </div>
    );
}

const containerStyle = { display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh', backgroundColor: '#f5f5f5' };
const formContainerStyle = { backgroundColor: 'white', padding: '40px', borderRadius: '8px', boxShadow: '0 2px 4px rgba(0,0,0,0.1)', width: '100%', maxWidth: '400px' };
const titleStyle = { textAlign: 'center' as const, marginBottom: '30px', color: '#333' };
const inputStyle = { width: '100%', padding: '12px', marginBottom: '15px', border: '1px solid #ddd', borderRadius: '4px', fontSize: '16px', boxSizing: 'border-box' as const };
const buttonStyle = { width: '100%', padding: '12px', backgroundColor: '#007bff', color: 'white', border: 'none', borderRadius: '4px', fontSize: '16px', cursor: 'pointer', marginTop: '10px' };
const errorStyle = { color: 'red', marginBottom: '15px', padding: '10px', backgroundColor: '#ffeeee', borderRadius: '4px', textAlign: 'center' as const };
const linkButtonStyle = { width: '100%', marginTop: '20px', background: 'none', border: 'none', color: '#007bff', cursor: 'pointer', fontSize: '14px' };