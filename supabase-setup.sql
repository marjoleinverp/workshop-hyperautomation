-- Supabase setup voor Workshop Hyperautomation
-- Voer dit uit in Supabase Dashboard > SQL Editor

CREATE TABLE ideas (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    level INTEGER DEFAULT 1,
    text TEXT NOT NULL,
    rating INTEGER DEFAULT 3,
    rating_count INTEGER DEFAULT 1,
    group_name TEXT,
    suggestions JSONB
);

-- Maak de tabel toegankelijk voor anonymous users
ALTER TABLE ideas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all operations for anon" ON ideas
    FOR ALL
    TO anon
    USING (true)
    WITH CHECK (true);
